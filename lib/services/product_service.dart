import "dart:convert";

import "package:http/http.dart" as http;

class ProductService {
  ProductService._();
  static ProductService instance() => ProductService._();
  getProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    return json.decode(response.body);
  }
}
