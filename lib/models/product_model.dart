class Product {
  String? id;
  String? name;
  double? price;
  String? image;

  Product({this.id, this.name, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price']);
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price.toString(),
      "image": image,
    };
  }
}
