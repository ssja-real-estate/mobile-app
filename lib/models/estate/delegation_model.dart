import 'package:saja/resources/Estate.dart';

class AssignmentModel {
  late String id;
  late String name;
  AssignmentModel({required this.id, required this.name});
  AssignmentModel.fromMap({required Map map}) {
    this.id = map[EstateStrings.assignmentId];
    this.name = map[EstateStrings.assignmentName];
  }
}
