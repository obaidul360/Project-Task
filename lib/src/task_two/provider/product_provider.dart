import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../services/api_sercive.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  bool isLoading = false;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products = await ProductService.fetchProducts();
    filteredProducts = products;

    isLoading = false;
    notifyListeners();
  }
  //SearchFounction
  void searchProduct(String query) {
    if (query.isEmpty) {
      filteredProducts = products; // empty হলে সব দেখানো হবে
    } else {
      filteredProducts = products
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
}
