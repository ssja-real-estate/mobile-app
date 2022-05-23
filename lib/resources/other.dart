import 'package:saja/models/estate_item.dart';

class Constants {
  static const Map<String, PropertyDelegationType> delegationTypeMap = {
    "فروش": PropertyDelegationType.Sell,
    "اجاره": PropertyDelegationType.Rent
  };

  static const Map<String, EstateType> estateTypeMap = {
    "خانه": EstateType.Home,
    "آپارتمان": EstateType.Apartment
  };

  static const Map<String, int> Provinces = {
    "کردستان": 1,
    "آذربایجان غربی": 2,
    "آذربایجان شرقی": 3,
  };
  static const Map<String, int> Cities = {
    "مهاباد": 2,
    "بوکان": 2,
    "سقز": 1,
  };
}

enum PropertyDelegationType {
  None,
  Sell,
  Rent,
}

enum PropertyType {
  None,
  House,
  Apartment,
}

