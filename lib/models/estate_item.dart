import 'dart:convert';

class EstateItem {
  String id;
  String estateType;
  String delegationType;
  String province;
  String city;
  int price;
  String? image;

  EstateItem({
    required this.id,
    required this.estateType,
    required this.delegationType,
    required this.province,
    required this.city,
    required this.price,
    this.image,
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
}
