import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';

void main() {
  group('Field Model', () {
    test('serializing a Field class instance of String FieldType', () {
      // Arrange
      Field field = Field(
        order: 0,
        type: FieldType.String,
        title: "Name",
        value: "John",
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 0);
      expect(map['type'], 0);
      expect(map['title'], 'Name');
      expect(map['value'], "John");
    });

    test('serializing a Field class instance of Number FieldType', () {
      // Arrange
      Field field = Field(
        order: 1,
        type: FieldType.Number,
        title: 'Price',
        value: 10000,
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 1);
      expect(map['type'], 1);
      expect(map['title'], 'Price');
      expect(map['value'], 10000);
    });

    test('serializing a Field class instance of Select FieldType', () {
      // Arrange
      Field field = Field(
        order: 2,
        type: FieldType.Select,
        title: 'Items',
        value: "Shoes",
        options: ["Shoes", "Jeans"],
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 2);
      expect(map['type'], 2);
      expect(map['title'], 'Items');
      expect(map['value'], "Shoes");
      expect(map['options'].length, 2);
      expect(map['options'][0], "Shoes");
      expect(map['options'][1], "Jeans");
    });

    test('serializing a Field class instance of Bool FieldType', () {
      // Arrange
      Field field = Field(
        order: 3,
        type: FieldType.Bool,
        title: 'HasWater',
        value: false,
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 3);
      expect(map['type'], 3);
      expect(map['title'], 'HasWater');
      expect(map['value'], false);
    });

    test('serializing a Field class instance of Conditional FieldType', () {
      // Arrange
      Field field = Field(
        order: 4,
        type: FieldType.Conditional,
        title: 'HasLoan',
        value: true,
        fields: [
          Field(
            order: 0,
            type: FieldType.String,
            title: "Description",
            value: "Loan Description",
          )
        ],
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 4);
      expect(map['type'], 4);
      expect(map['title'], 'HasLoan');
      expect(map['value'], true);

      var fields = map['fields'];
      expect(fields.length, 1);
      expect(fields[0]['order'], 0);
      expect(fields[0]['type'], 0);
      expect(fields[0]['title'], "Description");
      expect(fields[0]['value'], "Loan Description");
    });

    test('serializing a Field class instance of Image FieldType', () {
      // Arrange
      Field field = Field(
        order: 5,
        type: FieldType.Image,
        title: 'Images',
        value: ["firstUrl", "secondUrl"],
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 5);
      expect(map['type'], 5);
      expect(map['title'], 'Images');

      var urls = map['value'];
      expect(urls.length, 2);
      expect(urls[0], 'firstUrl');
      expect(urls[1], 'secondUrl');
    });

    test('serializing a Field class instance of Range FieldType', () {
      // Arrange
      Field field = Field(
        order: 6,
        type: FieldType.Range,
        title: 'Range',
        value: 150,
        min: 1,
        max: 200,
      );

      // Act
      var target = field.toJson();
      var map = json.decode(target);

      // Assert
      expect(map['order'], 6);
      expect(map['type'], 6);
      expect(map['title'], 'Range');

      int min = map['min'];
      int max = map['max'];
      int value = map['value'];
      expect(value > min && value < max, true);
    });

    test(
        'given a json of String FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 0,
        "type": 0,
        "title": "Name",
        "value": null,
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 0);
      expect(field.type, FieldType.String);
      expect(field.title, "Name");
      expect(field.value, null);
    });

    test(
        'given a json of Number FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 1,
        "type": 1,
        "title": "Price",
        "value": null,
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 1);
      expect(field.type, FieldType.Number);
      expect(field.title, "Price");
      expect(field.value, null);
    });

    test(
        'given a json of Select FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 2,
        "type": 2,
        "title": "Items",
        "value": null,
        "options": ["Bag", "Shoes"]
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 2);
      expect(field.type, FieldType.Select);
      expect(field.title, "Items");
      expect(field.value, null);

      var options = field.options;
      expect(options != null, true);
      expect(options!.length, 2);
      expect(options[0], "Bag");
      expect(options[1], "Shoes");
    });

    test(
        'given a json of Bool FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 3,
        "type": 3,
        "title": "Is Correct",
        "value": null,
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 3);
      expect(field.type, FieldType.Bool);
      expect(field.title, "Is Correct");
      expect(field.value, null);
    });

    test(
        'given a json of Conditional FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 4,
        "type": 4,
        "title": "Has Loan",
        "value": null,
        "fields": [
          {
            "order": 0,
            "type": 1,
            "title": "Loan Price",
            "value": null,
          }
        ]
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 4);
      expect(field.type, FieldType.Conditional);
      expect(field.title, "Has Loan");
      expect(field.value, null);

      var innerFields = field.fields;
      expect(innerFields != null, true);
      expect(innerFields!.length, 1);
      expect(innerFields[0].order, 0);
      expect(innerFields[0].type, FieldType.Number);
      expect(innerFields[0].title, "Loan Price");
      expect(innerFields[0].value, null);
    });

    test(
        'given a json of Image FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 5,
        "type": 5,
        "title": "Images",
        "value": null,
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 5);
      expect(field.type, FieldType.Image);
      expect(field.title, "Images");
      expect(field.value, null);
    });

    test(
        'given a json of Range FieldType then deserialize to a Field class instance',
        () {
      // Arrange
      const Map<String, dynamic> map = {
        "order": 6,
        "type": 6,
        "title": "Price Range",
        "value": null,
        "min": 10,
        "max": 50
      };
      var source = json.encode(map);

      // Act
      var field = Field.fromJson(source);

      // Assert
      expect(field.order, 6);
      expect(field.type, FieldType.Range);
      expect(field.title, "Price Range");
      expect(field.value, null);
      expect(field.min != null, true);
      expect(field.max != null, true);
      expect(field.min, 10);
      expect(field.max, 50);
    });
  });
}
