import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);

    // Example categories
    final categories = [
      "Filter",
      "men's clothing",
      "women's clothing",
      "jewelery",
      "electronics"
    ];

    String selectedCategory = "Filter";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: StatefulBuilder(
        builder: (context, setState) {
          return DropdownButtonFormField<String>(
            value: selectedCategory,
            items: categories
                .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e[0].toUpperCase() + e.substring(1),
                style: TextStyle(fontSize: 16),
              ),
            ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedCategory = value;
                });
                provider.filterByCategory(value);
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
          );
        },
      ),
    );
  }
}
