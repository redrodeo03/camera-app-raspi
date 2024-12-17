import 'dart:convert';
import '../models/location_model.dart';
import '../resources/repository.dart';

class LocationsBloc {
  final Repository _repository = Repository();

  Future<Object> getLocation(String id) async {
    var response = await _repository.getLocation(id);
    return response;
  }

  Future<Object> addLocation(Location location) async {
    var response = await _repository.addLocation(location);

    return response;
  }

  updateLocation(Location location) async {
    var response =
        await _repository.updateLocation(location, location.id as String);
    return response;
  }

  deleteLocation(String id, String? type, String name, String parentId,
      String parentType, bool isVisible) async {
    final locationObject = jsonEncode({
      'name': name,
      'type': type,
      'parentType': parentType,
      'isVisible': isVisible,
      'parentId': parentId
    });
    var response = await _repository.deleteLocation(locationObject, id);
    return response;
  }
}

final locationsBloc = LocationsBloc();
