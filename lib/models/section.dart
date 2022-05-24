import 'dart:convert';

import 'package:saja/services/validation/models_validator.dart';

import 'package:saja/models/field.dart';

class Section {
  String title;
  List<Field> fields;

  Section({
    required this.title,
    required this.fields,
  });

  Map<String, dynamic> toMap() {
    this.validate();
    return {
      'title': title,
      'fields': fields.map((x) => x.toMap()).toList(),
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    map.validateSectionJson();
    return Section(
      title: map['title'],
      fields: List<Field>.from(map['fields'].map((x) => Field.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source));
}
