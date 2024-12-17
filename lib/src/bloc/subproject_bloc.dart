import '../models/subproject_model.dart';
import '../resources/repository.dart';

class SubProjectBloc {
  final Repository _repository = Repository();

  Future<Object> getSubProject(String id) async {
    var response = await _repository.getSubProject(id);
    return response;
  }

  Future<Object> addSubProject(SubProject subProject) async {
    var response = await _repository.addSubProject(subProject);

    return response;
  }

  updateSubProject(SubProject subProject) async {
    var response =
        await _repository.updateSubProject(subProject, subProject.id as String);
    return response;
  }
}

final subProjectsBloc = SubProjectBloc();
