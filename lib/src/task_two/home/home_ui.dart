import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
import '../widgets/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Color(0xB3E5C8C2),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(

      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          SearchBox(),
          Expanded(
            child: ListView.builder(
              itemCount: provider.filteredProducts.length,
              itemBuilder: (context, index) {
                final item = provider.filteredProducts[index];
                return Card(
                  elevation: 1,
                  color: Color(0xB3E5C8C2),
                  child: ListTile(
                    leading: Image.network(item.image, height: 50),
                    title: Text(item.title),
                    subtitle: Text(
                      "⭐ ${item.rating.rate}   |   \$${item.price}",
                    ),
                  ),
                );
              },
            ),
            /*ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final items = provider.products[index];
              return Card(
                elevation: 1,
                color: Color(0xB3E5C8C2),
                child: ListTile(
                  leading: Image.network(items.image, height: 50),
                  title: Text(items.title),
                  subtitle: Text(
                    "⭐ ${items.rating.rate}   |   \$${items.price}",
                  ),
                ),
              );
            },
          ),*/
          )
        ],
      )
    );
  }
}
