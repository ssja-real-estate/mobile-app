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
