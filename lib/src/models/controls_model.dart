import 'dart:convert';

ControlsModel controlsModelFromJson(String str) =>
    ControlsModel.fromJson(json.decode(str));

String controlsModelToJson(ControlsModel data) => json.encode(data.toJson());

class ControlsModel {
  Form form;

  ControlsModel({
    required this.form,
  });

  factory ControlsModel.fromJson(Map<String, dynamic> json) => ControlsModel(
        form: Form.fromJson(json["form"]),
      );

  Map<String, dynamic> toJson() => {
        "form": form.toJson(),
      };
}

class Form {
  String id;
  String header;
  List<Control> controls;

  Form({
    required this.id,
    required this.header,
    required this.controls,
  });

  factory Form.fromJson(Map<String, dynamic> json) => Form(
        id: json["id"],
        header: json["header"],
        controls: List<Control>.from(
            json["controls"].map((x) => Control.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "controls": List<dynamic>.from(controls.map((x) => x.toJson())),
      };
}

class Control {
  String name;
  String type;
  String header;
  List<String>? values;
  String? defaultValue;
  String? minDate;
  String? maxDate;
  List<String>? selectedValues;

  Control({
    required this.name,
    required this.type,
    required this.header,
    this.values,
    this.defaultValue,
    this.minDate,
    this.maxDate,
    this.selectedValues,
  });

  factory Control.fromJson(Map<String, dynamic> json) => Control(
        name: json["name"],
        type: json["type"],
        header: json["header"],
        values: json["values"] == null
            ? []
            : List<String>.from(json["values"].map((x) => x)),
        defaultValue: json["defaultValue"] ?? '',
        minDate: json["minDate"] ?? '',
        maxDate: json["maxDate"] ?? '',
        selectedValues: json["selectedValues"] == null
            ? []
            : List<String>.from(json["selectedValues"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "header": header,
        "values": List<dynamic>.from(values!.map((x) => x)),
        "defaultValue": defaultValue,
        "minDate": minDate,
        "maxDate": maxDate,
        "selectedValues": List<dynamic>.from(selectedValues!.map((x) => x)),
      };
}
