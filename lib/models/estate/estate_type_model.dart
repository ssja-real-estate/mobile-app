import 'package:saja/resources/Estate.dart';

class EstateTypeModel {
  String? id, name;
  EstateTypeModel.fromMap({required Map map}) {
    id = map[EstateStrings.estateTypeId];
    name = map[EstateStrings.estateTypeName];
  }
}
