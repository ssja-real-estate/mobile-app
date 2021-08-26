import 'dart:convert';

import 'package:saja/models/section.dart';

class Form {
  int id;
  List<Section> sections;

  Form({
    required this.id,
    required this.sections,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory Form.fromMap(Map<String, dynamic> map) {
    return Form(
      id: map['id'],
      sections:
          List<Section>.from(map['sections'].map((x) => Section.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Form.fromJson(String source) => Form.fromMap(json.decode(source));
}
