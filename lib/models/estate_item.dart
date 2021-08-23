import 'dart:convert';

class EstateItem {
  int id;
  int estateType;
  int delegationType;
  String province;
  String city;
  int price;
  String? imageUrl;

  EstateItem({
    required this.id,
    required this.estateType,
    required this.delegationType,
    required this.province,
    required this.city,
    required this.price,
    this.imageUrl,
  });

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

  factory EstateItem.fromMap(Map<String, dynamic> map) {
    return EstateItem(
      id: map['id'],
      estateType: map['estateType'],
      delegationType: map['delegationType'],
      province: map['province'],
      city: map['city'],
      price: map['price'],
    );
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

  static String getDelegationType(int index) {
    var type = DelegationType.values[index];
    if (type == DelegationType.Sell) {
      return "فروش";
    } else {
      return "اجاره";
    }
  }
}

enum EstateType { Home, Apartment }

enum DelegationType { Sell, Rent }
