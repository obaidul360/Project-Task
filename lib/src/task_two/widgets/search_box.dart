import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        style: TextStyle(color: Colors.blueAccent, fontSize: 20),
        onChanged: (value) => provider.searchProduct(value),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.red),
          hintText: "Search products...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
