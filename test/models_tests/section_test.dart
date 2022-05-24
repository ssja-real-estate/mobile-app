import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';
import 'package:saja/models/section.dart';

void main() {
  group('Section Model', () {
    test('serialize a JSON string to a Section class instance', () {
      // Arrange
      Section section = Section(
        title: 'Section',
        fields: [
          Field(
            type: FieldType.String,
            title: 'Name',
            value: "Jack",
          ),
        ],
      );

      // Act
      var target = section.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['title'], 'Section');
      expect(map['fields'] != null, true);
      expect(map['fields'].length, 1);
    });

    test('deserialize an instance of Section class', () {
      // Arrange
      const Map<String, dynamic> map = {
        'title': 'Section',
        'fields': [
          {
            'type': 1,
            'title': 'Price',
            'value': null,
          }
        ]
      };
      var source = json.encode(map);

      // Act
      var section = Section.fromJson(source);

      // Assert
      expect(section.title, 'Section');
      expect(section.fields.length, 1);
      expect(section.fields[0].type, FieldType.Number);
      expect(section.fields[0].title, 'Price');
      expect(section.fields[0].value, null);
    });
  });
}
