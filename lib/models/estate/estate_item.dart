import 'dart:convert';

class EstateItem {
  late String id;
  late String? estateType;
  late String? estateTypeId;
  String? delegationTypeId;
  String? delegationType;
  late String? province;
  late String? city;
  late String? price;
  late String? imageUrl;

  // EstateItem({
  //   required this.id,
  //   required this.estateType,
  //   required this.delegationType,
  //   required this.province,
  //   required this.city,
  //   required this.price,
  //   this.imageUrl,
  // });
  static final EstateItem _instance = EstateItem._internal();
  factory EstateItem() => _instance;
  EstateItem._internal();
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estateType': estateType,
      'delegationType': delegationType,
      'province': province,
      'city': city,
      'price': price,
    };
  }

  EstateItem.notSingle();
  EstateItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    estateType = map['estateType'];
    delegationType = map['delegationType'];
    province = map['province'];
    city = map['city'];
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
