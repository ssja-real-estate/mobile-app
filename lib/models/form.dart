import 'dart:convert';

import 'package:saja/services/validation/models_validator.dart';

import 'package:saja/models/section.dart';

class Form {
  int id;
  List<Section> sections;
  String? name;

  Form({
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

  factory Form.fromMap(Map<String, dynamic> map) {
    map.validateFormJson();
    return Form(
      id: map['id'],
      name: map['name'],
      sections:
          List<Section>.from(map['sections'].map((x) => Section.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Form.fromJson(String source) => Form.fromMap(json.decode(source));
}
