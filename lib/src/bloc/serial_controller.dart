// import 'dart:async';
// import 'dart:typed_data';

// import 'package:get/get.dart';
// import 'package:usb_serial/transaction.dart';
// import 'package:usb_serial/usb_serial.dart';

// class SerialController extends GetxController {
//   UsbPort? _port;
//   UsbDevice? _device;
//   StreamSubscription<String>? _subscription;
//   Transaction<String>? _transaction;
//   //int? _deviceId;
//   String logMessage = "";
//   final hardwareKeyConnected = false.obs;
//   final base64data = "".obs;

//   Future<bool> _connectTo(device) async {
//     try {
//       if (_subscription != null) {
//         _subscription!.cancel();
//         _subscription = null;
//       }

//       if (_transaction != null) {
//         _transaction!.dispose();
//         _transaction = null;
//       }

//       if (_port != null) {
//         _port!.close();
//         _port = null;
//       }

//       if (device == null) {
//         _device = null;
//         return true;
//       }

//       _port = await device.create();
//       if (await _port!.open() != true) {
//         print("Failed to open port");
//         return false;
//       }

//       _device = device;

//       await _port!.setDTR(true);
//       await _port!.setRTS(true);
//       await _port!.setPortParameters(
//           2000000, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

//       _transaction = Transaction.stringTerminated(
//           _port!.inputStream as Stream<Uint8List>,
//           Uint8List.fromList([13, 10]));

//       _subscription = _transaction!.stream.listen((String line) {
//         base64data.value = line;
//         print(line);
//       }, onError: (error) {
//         print(error);
//       });
//       return true;
//     } catch (e) {
//       return true;
//     }
//   }

//   void _getPorts() async {
//     List<UsbDevice> devices = await UsbSerial.listDevices();
//     if (!devices.contains(_device)) {
//       _connectTo(null);
//     }
//     print(devices);
//     bool targetDeviceFound = false;

//     devices.forEach((device) {
//       logMessage = "[Log] device pid: ${device.pid}, device vid: ${device.vid}";
//       print(logMessage);
//       if (device.pid == 60000 && device.vid == 4292 || // CP210x UART
//           device.pid == 24577 && device.vid == 1027 || // FT232R UART
//           device.pid == 29987 && device.vid == 6790) // CAMERA_MODEL_AI_THINKER
//       {
//         targetDeviceFound = true;

//         if (!hardwareKeyConnected.value) {
//           _connectTo(device).then((res) {
//             hardwareKeyConnected.value = res;
//           });
//         }
//       }
//     });

//     if (!targetDeviceFound) {
//       hardwareKeyConnected.value = false;
//     }
//   }

//   void sendString(String text) async {
//     if (_port == null) return;
//     await _port!.write(Uint8List.fromList(text.codeUnits));
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     UsbSerial.usbEventStream!.listen((UsbEvent event) {
//       _getPorts();
//     });
//     _getPorts();
//   }

//   @override
//   void onClose() {
//     _connectTo(null);
//     super.onClose();
//   }
// }
