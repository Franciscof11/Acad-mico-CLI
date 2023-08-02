import 'dart:convert';

class Product {
  int id;
  String name;

  Product({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromJson(String json) => Product.fromMap(jsonDecode(json));

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }
}
