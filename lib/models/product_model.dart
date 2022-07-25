class Product {
  int id;
  String name;
  double price;
  String image;

  Product(this.id, this.name, this.price, this.image);

  // create dummy list of products from model
  static List<Product> productList() {
    return [
      Product(
        1,
        'Kresek Transparan - HD DUO 10 ',
        4445,
        'https://cdn.hijiofficial.com//products/508d318135f96f524f74b5cdc06038fb.jpg',
      ),
      Product(
        2,
        'Kresek Hitam Putih - HD DUO 15 ',
        5834,
        'https://cdn.hijiofficial.com//products/4af2e85a12118276dc71229ef3bcb168.jpg',
      ),
      Product(
        3,
        'Kresek Hitam Putih - HD DUO 18',
        8056,
        'https://cdn.hijiofficial.com//products/1bd64fcfdd8c89a490763a443747d1f9.jpg',
      ),
      Product(
        4,
        'Kresek Hitam - HD DUO 21',
        8445,
        'https://cdn.hijiofficial.com//products/e028813f47fb4666257e9038957b8e71.jpg',
      ),
      Product(
        5,
        'Kresek Hitam Putih - HD DUO 24',
        11056,
        'https://cdn.hijiofficial.com//products/0a8e46813ea07e633ca6f831fa68b9f7.jpg',
      ),
    ];
  }
}
