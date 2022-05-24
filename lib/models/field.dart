import 'dart:convert';

import 'package:saja/services/validation/models_validator.dart';

import 'enums/field_type.dart';

class Field {
  FieldType type;
  String title;
  dynamic value;
  List<String>? options;
  List<Field>? fields;
  int? min;
  int? max;
  bool? optional;

  Field({
    required this.type,
    required this.title,
    required this.value,
    this.options,
    this.fields,
    this.min,
    this.max,
    this.optional,
  });

  Map<String, dynamic> toMap() {
    this.validate();
    return {
      'type': type.index,
      'title': title,
      'value': value,
      'options': options,
      'fields': fields?.map((e) => e.toMap()).toList(),
      'min': min,
      'max': max,
      'optional': optional
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    map.validateFieldJson();
    FieldType fieldType = FieldType.values[map['type']];
    List<String>? options;
    List<Field>? fields;
    if (fieldType == FieldType.Select) {
      options = map.getListValues('options', (option) => option.toString());
    } else if (fieldType == FieldType.Conditional) {
      fields =
          map.getListValues<Field>('fields', (field) => Field.fromMap(field));
    }

    return Field(
      type: FieldType.values[map['type']],
      title: map['title'],
      value: map['value'],
      options: options,
      fields: fields,
      min: map.getValue('min'),
      max: map.getValue('max'),
      optional: map.getValue('optional'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source));
}
