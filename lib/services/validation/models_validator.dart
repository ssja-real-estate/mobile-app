import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';
import 'package:saja/models/form.dart';
import 'package:saja/models/section.dart';

typedef Mapper<T> = T Function(dynamic map);

extension JsonValidator on Map<String, dynamic> {
  T? getValue<T>(String key) {
    T? value;
    if (this.containsKey(key)) {
      value = this[key];
    }
    return value;
  }

  List<T>? getListValues<T>(String key, Mapper<T> mapper) {
    List<T>? values;
    if (this.containsKey(key)) {
      values = [];
      if (this[key] != null) {
        this[key].forEach((element) {
          values!.add(mapper(element));
        });
      }
    }
    return values;
  }

  void validateFieldJson() {
    assert(this['order'] != null);
    assert(this['type'] != null);
    assert(this['title'] != null);
    assert(this['title'] != "");

    var length = FieldType.values.length;
    int typeIndex = this['type'];
    assert(typeIndex >= 0 && typeIndex <= length - 1);

    var fieldType = FieldType.values[typeIndex];
    switch (fieldType) {
      case FieldType.Select:
        assert(this['options'] != null);
        assert(this['options'].length > 1);
        break;
      case FieldType.Conditional:
        assert(this['fields'] != null);
        var fields =
            List<Field>.from(this['fields'].map((f) => Field.fromMap(f)));
        assert(fields.length > 0);
        fields.forEach((field) {
          field.validate();
        });
        break;
      case FieldType.Range:
        assert(this['min'] != null);
        assert(this['max'] != null);
        break;
      default:
        break;
    }
  }

  void validateSectionJson() {
    assert(this['order'] != null);
    assert(this['title'] != null);
    assert(this['title'] != "");
    assert(this['fields'] != null);
    assert(this['fields'].length != 0);
  }

  void validateFormJson() {
    assert(this['id'] != null);
    assert(this['sections'] != null);
    assert(this['sections'].length > 0);
  }
}

extension FieldValidator on Field {
  void validate() {
    assert(this.order >= 0);
    assert(this.title != "");

    switch (this.type) {
      case FieldType.Select:
        assert(this.options != null);
        assert(this.options!.length != 0);
        break;
      case FieldType.Conditional:
        assert(this.fields != null);
        assert(this.fields!.length != 0);
        break;
      case FieldType.Range:
        assert(this.min != null);
        assert(this.max != null);
        break;
      default:
        break;
    }
  }
}

extension SectionValidator on Section {
  void validate() {
    assert(this.order >= 0);
    assert(this.title != "");
    assert(this.fields.length > 0);
  }
}

extension FormValidator on Form {
  void validate() {
    assert(this.sections.length > 0);
  }
}
