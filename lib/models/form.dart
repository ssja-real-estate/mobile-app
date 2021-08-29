import 'dart:convert';

import 'package:saja/services/validation/models_validator.dart';

import 'package:saja/models/section.dart';

class EstateForm {
  int id;
  List<Section> sections;
  String? name;

  EstateForm({
    required this.id,
    required this.sections,
    this.name,
  });

  Map<String, dynamic> toMap() {
    this.validate();
    return {
      'id': id,
      'name': name,
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory EstateForm.fromMap(Map<String, dynamic> map) {
    map.validateFormJson();
    return EstateForm(
      id: map['id'],
      name: map['name'],
      sections:
          List<Section>.from(map['sections'].map((x) => Section.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EstateForm.fromJson(String source) =>
      EstateForm.fromMap(json.decode(source));
}
