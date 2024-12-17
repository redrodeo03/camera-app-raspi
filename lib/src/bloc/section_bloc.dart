import '../models/section_model.dart';
import '../resources/repository.dart';

class SectionBloc {
  final Repository _repository = Repository();

  Future<Object> getSection(String id) async {
    var response = await _repository.getSection(id);
    return response;
  }

  Future<Object> addSection(VisualSection visualSection) async {
    var response = await _repository.addSection(visualSection);

    return response;
  }

  Future<Object> updateSection(VisualSection visualSection) async {
    var response = await _repository.updateSection(
        visualSection, visualSection.id as String);

    return response;
  }
}

final sectionsBloc = SectionBloc();
