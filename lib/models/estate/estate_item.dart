import 'dart:convert';

import 'package:saja/models/estate/city_model.dart';
import 'package:saja/models/estate/delegation_model.dart';
import 'package:saja/models/estate/estate_type_model.dart';
import 'package:saja/models/estate/province_model.dart';

class EstateItem {
  late String id;
  // late String? estateType;
  // late String? estateTypeId;
  // String? delegationTypeId;
  // String? delegationType;
  // late String? province;
  // late String? city;
  late String? price;
  late String? imageUrl;
  late EstateTypeModel? estateTypeModel;
  late AssignmentModel? assignmentModel;
  late CityModel? cityModel;
  late ProvinceModel? provinceModel;
  static final EstateItem _instance = EstateItem._internal();
  factory EstateItem() => _instance;
  EstateItem._internal();
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estateType': estateTypeModel!.name,
      'delegationType': assignmentModel!.name,
      'province': provinceModel!.name,
      'city': cityModel!.name,
      'price': price,
    };
  }

  EstateItem.notSingle();
  EstateItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    estateTypeModel!.name = map['estateType'];
    assignmentModel!.name = map['delegationType'];
    provinceModel!.name = map['province'];
    cityModel!.name = map['city'];
    price = map['price'];
    // return EstateItem(
    //   id: map['id'],
    //   estateType: map['estateType'],
    //   delegationType: map['delegationType'],
    //   province: map['province'],
    //   city: map['city'],
    //   price: map['price'],
    // );
  }

  String toJson() => json.encode(toMap());

  factory EstateItem.fromJson(String source) =>
      EstateItem.fromMap(json.decode(source));

  static String getEstateType(int index) {
    var type = EstateType.values[index];
    if (type == EstateType.Home) {
      return "خانه";
    } else {
      return "آپارتمان";
    }
  }
}

enum EstateType { Home, Apartment }

enum DelegationType { Sell, Rent }
