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
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }

  // Filter Catagorise
  void filterByCategory(String category) {
    if (category == "Filter") {
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where((p) => p.category.toLowerCase() == category.toLowerCase())
          .toList();
    }
    notifyListeners();
  }

  Map<int, int> productQuantity = {};
  // Quantity functions
  void addQuantity(int productId) {
    if (productQuantity.containsKey(productId)) {
      productQuantity[productId] = productQuantity[productId]! + 1;
    } else {
      productQuantity[productId] = 1;
    }
    notifyListeners();
  }

  void subtractQuantity(int productId) {
    if (productQuantity.containsKey(productId) &&
        productQuantity[productId]! > 0) {
      productQuantity[productId] = productQuantity[productId]! - 1;
      notifyListeners();
    }
  }

  int getQuantity(int productId) {
    return productQuantity[productId] ?? 0;
  }

  double getTotalPrice(int productId, double price) {
    return getQuantity(productId) * price;
  }
}
