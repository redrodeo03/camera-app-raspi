import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Widget networkImage(String? netWorkImageURL) {
  String imageURL = "";
  if (netWorkImageURL == null) {
    return Image.asset(
      "assets/images/icon.png",
      fit: BoxFit.fill,
      width: double.infinity,
    );
  } else {
    imageURL = netWorkImageURL;
  }
  if (imageURL.startsWith('http')) {
    // return Image.network(
    //   imageURL, width: double.infinity,
    //   fit: BoxFit.fill,
    //   // When image is loading from the server it takes some time
    //   // So we will show progress indicator while loading
    //   loadingBuilder: (BuildContext context, Widget child,
    //       ImageChunkEvent? loadingProgress) {
    //     if (loadingProgress == null) return child;
    //     return Center(
    //       child: CircularProgressIndicator(
    //         value: loadingProgress.expectedTotalBytes != null
    //             ? loadingProgress.cumulativeBytesLoaded /
    //                 loadingProgress.expectedTotalBytes!
    //             : null,
    //       ),
    //     );
    //   },

    //   errorBuilder: (context, exception, stackTrace) {
    //     return Image.asset(
    //       "assets/images/icon.png",
    //       fit: BoxFit.fill,
    //       width: double.infinity,
    //     );
    //   },
    // );
    return CachedNetworkImage(
      placeholder: (context, url) => const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
      imageUrl: imageURL,
      fit: BoxFit.cover,
    );
  } else {
    return FutureBuilder<File?>(
      future: getImageFile(imageURL),
      builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data == null) {
            // Handle errors or file not found
            //return Text('Error loading image');
            return Image.asset(
              "assets/images/icon.png",
              fit: BoxFit.fill,
              width: double.infinity,
            );
          }

          return Image.file(
            snapshot.data!,
            fit: BoxFit.fill,
            width: double.infinity,
          );
        } else {
          // While the Future is still running, show a loading indicator or placeholder
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

Future<File?> getImageFile(imageURL) async {
  if (Platform.isIOS) {
    imageURL = path.join(await localPath, imageURL);
  }

  if (File(imageURL).existsSync()) {
    return File(imageURL);
  }

  return null; // Return null if the file doesn't exist
}

Future<String> get localPath async {
  final directory = await getApplicationSupportDirectory();

  return directory.path;
}
