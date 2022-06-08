import 'dart:convert';

import 'package:saja/models/estate/delegation_model.dart';
import 'package:saja/models/estate/estate_type_model.dart';
import 'package:saja/models/estate/province_model.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/services/api/api.dart';

class EstateServices {
  static Future<List<AssignmentModel>> getAssignmentType(
      {required String token}) async {
    try {
      Map<String, String> map = {};
      map.addAll({ApiStrings.authorization: token});
      map.addAll(Api.headeroption);
      var result =
          await Api.get(unicode: ApiStrings.assignmentTypeAddress, header: map)
              .catchError((e) {
        throw e;
      });

      var list = (result);

      List<AssignmentModel> delegationModels = [];
      for (var element in list) {
        delegationModels.add(AssignmentModel.fromMap(map: element));
      }
      return delegationModels;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<EstateTypeModel>> getEstateType(
      {required String token}) async {
    Map<String, String> map = {};
    map.addAll({ApiStrings.authorization: token});
    map.addAll(Api.headeroption);
    try {
      List<EstateTypeModel> estateTypeModels = [];
      var result =
          await Api.get(unicode: ApiStrings.estateTypeAddress, header: map);

      for (var element in result) {
        estateTypeModels.add(EstateTypeModel.fromMap(map: element));
      }
      return estateTypeModels;
    } catch (e) {
      rethrow;
    }
  }
  static Future<List<ProvinceModel>> getProvince(
      {required String token}) async {
    Map<String, String> map = {};
    map.addAll({ApiStrings.authorization: token});
    map.addAll(Api.headeroption);
    try {
      List<ProvinceModel> provinceModels = [];
      var result =
          await Api.get(unicode: ApiStrings.provinceAddress, header: map);
      for (var element in result) {
        provinceModels.add(ProvinceModel.fromMap(map: element));
      }
      return provinceModels;
    } catch (e) {
      rethrow;
    }
  }
}
