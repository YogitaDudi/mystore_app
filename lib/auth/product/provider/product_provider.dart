
import 'package:flutter/foundation.dart';
import 'package:mystore/auth/product/model/product_model.dart';
import 'package:mystore/auth/product/service/Product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];
  final ProductService productService;
  String errorMessage = '';
  bool isLoading = false;

  ProductProvider(this.productService);

  Future<void> fetchProduct() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      productList = await productService.fetchProducts();
    } catch (e) {
      errorMessage = 'Failed to fetch products: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
