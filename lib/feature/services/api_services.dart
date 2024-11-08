import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machinetest_trogun/feature/model/product_model.dart';

class ApiServices {
  static Future<List<Products>> getProducts() async {
    final response = await http.get(
        Uri.parse('https://fake-store-api.mock.beeceptor.com/api/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final products = data.map((e) => Products.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
