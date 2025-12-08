import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleup/src/task_one/login_ui.dart';

import '../provider/product_provider.dart';
import '../widgets/filter_box.dart';
import '../widgets/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginUiScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("Products"),
        backgroundColor: Color(0xB3E5C8C2),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 28)),
        ],
      ),
      drawer: Drawer(),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SearchBox(),
                CategoryDropdown(),
                SizedBox(height: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                      itemCount: provider.filteredProducts.length,
                      itemBuilder: (context, index) {
                        final item = provider.filteredProducts[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 1,
                            color: Color(0xBDFFF2F0),
                            child: ListTile(
                              leading: Image.network(item.image, height: 50),
                              title: Text(item.title),
                              subtitle: Text(
                                "⭐ ${item.rating.rate}   |   \$${item.price}",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
