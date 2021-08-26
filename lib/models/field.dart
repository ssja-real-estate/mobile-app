import 'dart:convert';

import 'enums/field_type.dart';

class Field {
  int order;
  FieldType type;
  String title;
  dynamic value;
  List<String>? options;
  List<Field>? fields;
  int? min;
  int? max;

  Field(
      {required this.order,
      required this.type,
      required this.title,
      required this.value,
      this.options,
      this.fields,
      this.min,
      this.max});

  Map<String, dynamic> toMap() {
    return {
      'order': order,
      'type': type.index,
      'title': title,
      'value': value,
      'options': options,
      'fields': fields?.map((e) => e.toMap()).toList(),
      'min': min,
      'max': max
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      order: map['order'],
      type: FieldType.values[map['type']],
      title: map['title'],
      value: map['value'],
      options: List<String>.from(map['options'].map((o) => o.toString())),
      fields: List<Field>.from(map['fields'].map((f) => Field.fromMap(f))),
      min: map['min'],
      max: map['max'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source));
}
