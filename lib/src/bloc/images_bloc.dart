import 'package:async/async.dart';

import '../resources/repository.dart';

class ImagesBloc {
  final Repository _repository = Repository();

  Future<Object> uploadImage(String path, String containerName, String uploader,
      String id, String parentType, String entityName) async {
    var response = await _repository.uploadImage(
        path, containerName, uploader, id, parentType, entityName);

    return response;
  }

  Future<Object> saveImageLocally(String path, String containerName,
      String uploader, String id, String parentType, String entityName) async {
    var response = await _repository.saveImageLocal(
        path, containerName, uploader, id, parentType, entityName);

    return response;
  }

  Future<List<Object>> uploadMultipleImages(
      List<String> imagePathList,
      String containerName,
      String uploader,
      String id,
      String parentType,
      String entityName) async {
    final FutureGroup<Object> futureGroup = FutureGroup<Object>();

    // Adding futures

    for (var element in imagePathList) {
      futureGroup.add(uploadImage(
          element, containerName, uploader, id, parentType, entityName));
    }
    // Signals that the adding process is done
    futureGroup.close();

    // Firing the future from the FutureGroup.future property
    final List<Object> results = await futureGroup.future;
    return results;
  }
}

final imagesBloc = ImagesBloc();
