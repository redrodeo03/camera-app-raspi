import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'image_widget.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;

  //File? _imageFile;

  // Initial values
  bool _isCameraInitialized = false;
  //bool _isCameraPermissionGranted = false;
  //bool _isRearCameraSelected = true;

  // double _minAvailableExposureOffset = 0.0;
  // double _maxAvailableExposureOffset = 0.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;

  // Current values
  double _currentZoomLevel = 1.0;
  // double _currentExposureOffset = 0.0;
  FlashMode? _currentFlashMode;

  List<File> allFileList = [];

  final resolutionPresets = ResolutionPreset.values;

  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;
  late List<CameraDescription> cameras;

  getCameraStatus() async {
    final cameras = await availableCameras();
    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    // setState(() {
    //   _isCameraPermissionGranted = true;
    // });
    // Set and initialize the new camera
    onNewCameraSelected(firstCamera);
  }

  List<XFile> capturedImages = [];
  Future<XFile?> takePicture(BuildContext context) async {
    final CameraController? cameraController = controller;
    controller?.setExposureMode(ExposureMode.locked);
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occured while taking picture: $e')),
      );

      return null;
    }
  }

  void resetCameraValues() async {
    _currentZoomLevel = 1.0;
    //_currentExposureOffset = 0.0;
    await resetTorch();
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    resetCameraValues();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    try {
      await cameraController.initialize();
      // await cameraController.setExposureMode(ExposureMode.);
      await Future.wait([
        cameraController.setExposureMode(ExposureMode.locked),
        // cameraController
        //     .getMinExposureOffset()
        //     .then((value) => _minAvailableExposureOffset = value),
        // cameraController
        //     .getMaxExposureOffset()
        //     .then((value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = 10),

        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
      ]);

      await controller!.setFlashMode(
        FlashMode.off,
      );
      _currentFlashMode = controller!.value.flashMode;
      _currentFlashMode = FlashMode.off;
    } on CameraException catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing camera: $e')),
      );
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future resetTorch() async {
    final currentFlash = controller?.value.flashMode;
    if (currentFlash != null) {
      //if (currentFlash == FlashMode.auto || currentFlash == FlashMode.always) {
      await controller!.setFlashMode(FlashMode.torch);
      //}
      await controller!.setFlashMode(FlashMode.off);
      await controller!.setFlashMode(currentFlash);
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    //controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  @override
  void initState() {
    // Hide the status bar in Android
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    getCameraStatus();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: _isCameraInitialized
              ? Column(
                  children: [
                    // AspectRatio(
                    //   aspectRatio: 1 / controller!.value.aspectRatio,
                    //   child:
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CameraPreview(
                            controller!,
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTapDown: (details) =>
                                    onViewFinderTap(details, constraints),
                              );
                            }),
                          ),
                          // Uncomment to preview the overlay
                          // Center(
                          //   child: Image.asset(
                          //     'assets/camera_aim.png',
                          //     color: Colors.greenAccent,
                          //     width: 150,
                          //     height: 150,
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              16.0,
                              8.0,
                              16.0,
                              8.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.black87,
                                //       borderRadius: BorderRadius.circular(10.0),
                                //     ),
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(
                                //         left: 8.0,
                                //         right: 8.0,
                                //       ),
                                //       child: DropdownButton<ResolutionPreset>(
                                //         dropdownColor: Colors.black87,
                                //         underline: Container(),
                                //         value: currentResolutionPreset,
                                //         items: [
                                //           for (ResolutionPreset preset
                                //               in resolutionPresets)
                                //             DropdownMenuItem(
                                //               value: preset,
                                //               child: Text(
                                //                 preset
                                //                     .toString()
                                //                     .split('.')[1]
                                //                     .toUpperCase(),
                                //                 style: const TextStyle(
                                //                     color: Colors.white),
                                //               ),
                                //             )
                                //         ],
                                //         onChanged: (value) {
                                //           setState(() {
                                //             currentResolutionPreset = value!;
                                //             _isCameraInitialized = false;
                                //           });
                                //           onNewCameraSelected(
                                //               controller!.description);
                                //         },
                                //         hint: const Text("select resolution"),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        shape: (RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            side: const BorderSide(
                                                color: Colors.blue)))),
                                    onPressed: () {
                                      Navigator.of(context).pop(capturedImages
                                          .map((e) => e.path)
                                          .toList());
                                    },
                                    icon: const Icon(
                                      Icons.done,
                                      size: 40,
                                    ),
                                    label: Text(
                                      'Save ${capturedImages.length}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    onTap: () async {
                                      if (controller!.value.isTakingPicture) {
                                        // A capture is already pending, do nothing.
                                        return;
                                      }

                                      try {
                                        controller!.setExposureMode(
                                            ExposureMode.locked);
                                        XFile file =
                                            await controller!.takePicture();
                                        await resetTorch();
                                        setState(() {
                                          capturedImages.add(file);
                                        });

                                        //var imageFile = File(file.path);
                                      } on CameraException catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Error occured while taking picture: $e')),
                                        );

                                        return;
                                      }
                                    },
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.circle,
                                        color: Colors.white,
                                        size: 80,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Slider(
                                        value: _currentZoomLevel,
                                        min: _minAvailableZoom,
                                        max: _maxAvailableZoom,
                                        activeColor: Colors.white,
                                        inactiveColor: Colors.white30,
                                        onChanged: (value) async {
                                          setState(() {
                                            _currentZoomLevel = value;
                                          });
                                          await controller!.setZoomLevel(value);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${_currentZoomLevel.toStringAsFixed(1)}x',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: capturedImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return horizontalScrollChildren(context, index);
                          }),
                    ),
                    SizedBox(
                      height: 50,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _currentFlashMode = FlashMode.off;
                                    });
                                    //await resetTorch();
                                    await controller!.setFlashMode(
                                      FlashMode.off,
                                    );
                                    await resetTorch();
                                  },
                                  child: Icon(
                                    Icons.flash_off,
                                    color: _currentFlashMode == FlashMode.off
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _currentFlashMode = FlashMode.auto;
                                    });
                                    await controller!.setFlashMode(
                                      FlashMode.auto,
                                    );
                                    await resetTorch();
                                  },
                                  child: Icon(
                                    Icons.flash_auto,
                                    color: _currentFlashMode == FlashMode.auto
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _currentFlashMode = FlashMode.torch;
                                    });
                                    await controller!.setFlashMode(
                                      FlashMode.torch,
                                    );
                                  },
                                  child: Icon(
                                    Icons.flash_on,
                                    color: _currentFlashMode == FlashMode.torch
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    'LOADING',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
    );
  }

  Widget horizontalScrollChildren(BuildContext context, int index) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    // image: networkImage(currentProject.url as String),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 1.0, color: Colors.blue)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: networkImage(capturedImages[index].path),
                ),
              ),
              Positioned(
                top: 0,
                width: 30,
                height: 20,
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      if (capturedImages.isNotEmpty) {
                        setState(() {
                          capturedImages.remove(capturedImages[index]);
                        });
                      }
                    },
                    icon: const Icon(Icons.delete_forever,
                        size: 20, color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
