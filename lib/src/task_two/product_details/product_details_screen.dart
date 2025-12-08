import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';
import '../provider/product_provider.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    int quantity = provider.getQuantity(widget.product.id);
    double totalPrice = provider.getTotalPrice(
      widget.product.id,
      widget.product.price,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(widget.product.image, height: 200)),
              const SizedBox(height: 16),
              Text(
                widget.product.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(widget.product.description),
              const SizedBox(height: 16),
              Text(
                "Price: \$${widget.product.price}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Row(
                children: [

                  IconButton(
                    onPressed: () =>
                        provider.subtractQuantity(widget.product.id),
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 4),
                  Text("$quantity", style: const TextStyle(fontSize: 20)),
                  SizedBox(width: 4),
                  IconButton(
                    onPressed: () =>
                        provider.addQuantity(widget.product.id),
                    icon: const Icon(Icons.add),
                  ),

                  const SizedBox(width: 20),
                  Text(
                    "Total: \$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Order now",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add to card",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
