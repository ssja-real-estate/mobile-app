import 'dart:convert';

import 'package:saja/services/validation/models_validator.dart';

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
    this.validate();
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
      order: map['order'],
      type: FieldType.values[map['type']],
      title: map['title'],
      value: map['value'],
      options: options,
      fields: fields,
      min: map.getValue('min'),
      max: map.getValue('max'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source));
}
