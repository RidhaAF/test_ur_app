class Product {
  String? id;
  String? name;
  double? price;
  String? variant;
  List<String>? images;

  Product({this.id, this.name, this.price, this.variant, this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price']),
      variant: json['is_variant'],
      images: (json['images'] as List<dynamic>)
          .map((images) => images as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price.toString(),
      "is_variant": variant,
      "images": images,
    };
  }
}
