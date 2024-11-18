import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mystore/auth/comman/api_point.dart';
import 'package:mystore/auth/product/model/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    String url = ApiEndpoint.getProduct;
    final response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if (response.statusCode == 200) {
      final maplist = jsonDecode(response.body);
      List<Product> productList = [];
      for (int a = 0; a < maplist.length; a++) {
        final map = maplist[a];
        Product product = Product.fromJson(map);
        productList.add(product);
      }
      return productList;
    } else {
      throw 'Unavailable product';
    }
  }
}
