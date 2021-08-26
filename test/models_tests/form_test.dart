import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';
import 'package:saja/models/form.dart';
import 'package:saja/models/section.dart';

void main() {
  group('Form Model', () {
    test('serialize an instance of Form class', () {
      // Arrange
      Form form = Form(
        id: 1,
        sections: [
          Section(
            order: 0,
            title: 'Section',
            fields: [
              Field(
                order: 0,
                type: FieldType.String,
                title: 'Name',
                value: null,
              ),
            ],
          ),
        ],
      );

      // Act
      var jsonString = form.toJson();
      var map = json.decode(jsonString);

      expect(map['id'], 1);
      expect(map['sections'] != null, true);
      expect(map['sections'].length, 1);
    });

    test('deserialize a JSON string to an instance of Form class', () {
      // Arrange
      const Map<String, dynamic> map = {
        'id': 1,
        'sections': [
          {
            'order': 0,
            'title': 'Section',
            'fields': [
              {
                'order': 0,
                'type': 0,
                'title': 'Name',
                'value': null,
              }
            ]
          }
        ]
      };

      // Act
      var source = json.encode(map);
      var form = Form.fromJson(source);

      expect(form.id, 1);
      expect(form.sections.length, 1);
    });
  });
}
