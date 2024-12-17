class InvasiveSection {
  String? invasivecomments;
  List<String?>? invasiveimages;

  InvasiveSection({this.invasivecomments, this.invasiveimages});
  InvasiveSection.fromJson(Map<String, dynamic> json) {
    invasivecomments = json['invasivecomments'];
    invasiveimages = json['invasiveimages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invasiveimages'] = invasiveimages;
    data['invasivecomments'] = invasivecomments;

    return data;
  }
}

class ConclusiveSection {
  String? conclusivecomments;
  List<String?>? conclusiveimages;

  ConclusiveSection({this.conclusivecomments, this.conclusiveimages});
  ConclusiveSection.fromJson(Map<String, dynamic> json) {
    conclusivecomments = json['conclusivecomments'];
    conclusiveimages = json['conclusiveimages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conclusivecomments'] = conclusivecomments;
    data['conclusiveimages'] = conclusiveimages;

    return data;
  }
}

class VisualSection {
  String? id;
  String? name;
  List<String>? images;
  List<String>? exteriorelements;
  List<String>? waterproofingelements;
  String? additionalconsiderations;
  String? visualreview;
  bool visualsignsofleak = false;
  bool furtherinvasivereviewrequired = true;
  String? conditionalassessment;
  String eee = 'one';
  String lbc = 'one';
  String awe = 'one';
  String? parentid;

  String? createdby;
  String? createdat;
  String? thumbnail;

  // InvasiveSection? invasiveSection;
  // ConclusiveSection? conclusiveSection;
  DateTime? editedat;
  String? lasteditedby;

  VisualSection(
      {this.id,
      this.name,
      this.images,
      this.exteriorelements,
      this.waterproofingelements,
      this.additionalconsiderations,
      this.createdat,
      this.thumbnail,
      this.editedat,
      this.lasteditedby,
      this.visualreview,
      required this.visualsignsofleak,
      required this.furtherinvasivereviewrequired,
      this.conditionalassessment,
      required this.awe,
      required this.eee,
      required this.lbc,
      this.createdby,
      this.parentid});

  VisualSection.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    additionalconsiderations = json['additionalconsiderations'];
    createdby = json['createdby'];
    createdat = json['createdat'];
    parentid = json['parentid'];
    visualreview = json['visualreview'];
    visualsignsofleak = json['visualsignsofleak'];
    furtherinvasivereviewrequired = json['furtherinvasivereviewrequired'];
    thumbnail = json['thumbnail'];
    conditionalassessment = json['conditionalassessment'];
    editedat =
        json['editedat'] == null ? null : DateTime.tryParse(json['editedat']);
    lasteditedby = json['lasteditedby'];
    eee = json['eee'];
    awe = json['awe'];
    lbc = json['lbc'];
    images = json['images'] == null
        ? []
        : List.castFrom<dynamic, String>(json['images']);
    exteriorelements = json['exteriorelements'] == null
        ? []
        : List.castFrom<dynamic, String>(json['exteriorelements']);
    waterproofingelements = json['waterproofingelements'] == null
        ? []
        : List.castFrom<dynamic, String>(json['waterproofingelements']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;

    data['images'] = images;
    data['exteriorelements'] = exteriorelements;
    data['waterproofingelements'] = waterproofingelements;
    data['createdby'] = createdby;
    data['thumbnail'] = thumbnail;
    data['visualreview'] = visualreview;
    data['visualsignsofleak'] = visualsignsofleak;
    data['eee'] = eee;
    data['awe'] = awe;
    data['lbc'] = lbc;
    data['additionalconsiderations'] = additionalconsiderations;
    data['furtherinvasivereviewrequired'] = furtherinvasivereviewrequired;
    data['conditionalassessment'] = conditionalassessment;

    data['lasteditedby'] = lasteditedby;

    return data;
  }
}

class SectionResponse {
  VisualSection? item;
  String? message;
  int? code;

  SectionResponse({this.item, this.message, this.code});

  SectionResponse.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? VisualSection?.fromJson(json['item']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item!.toJson();
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}
