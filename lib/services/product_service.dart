import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_ur_app/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://api-dev.hijiofficial.com/v3/products/GetAll.php';

  Future<List<Product>> fetchProducts() async {
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['products'];
      List<Product> products = [];

      // limit products to 10
      // for (int i = 0; i < 15; i++) {
      //   products.add(Product.fromJson(data[i]));
      // }

      for (var item in data) {
        products.add(Product.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal fetch produk!');
    }
  }
}
