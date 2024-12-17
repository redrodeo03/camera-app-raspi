import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Widget cachedNetworkImage(String? imageUrl) {
  if (imageUrl == null) {
    return Image.asset(
      "assets/images/icon.png",
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }
  if (imageUrl.startsWith('http')) {
    return CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
        imageUrl: imageUrl,
        fadeOutDuration: const Duration(seconds: 1),
        fadeInDuration: const Duration(seconds: 3),
        errorWidget: (context, url, error) => Image.asset(
              "assets/images/icon.png",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ));
  } else {
    return FutureBuilder<File?>(
      future: getImageFile(imageUrl),
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
  //print(imageURL);
  if (File(imageURL).existsSync()) {
    return File(imageURL);
  }

  return null; // Return null if the file doesn't exist
}

Future<String> get localPath async {
  final directory = await getApplicationSupportDirectory();

  return directory.path;
}
