import 'package:flutter/material.dart';
import 'package:grocery_management/entity/product.dart';
import 'package:grocery_management/pages/edit_product_page.dart';
import 'package:grocery_management/services/app_service.dart';

class AppProductTile extends StatelessWidget {
  final appService = AppService();

  AppProductTile({super.key, required this.product});

  final Product product;

  void deleteProduct() {
    appService.deleteProduct(product.id, product.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Rounded image
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Adjust this value for the rounding
            child: Image.network(
              product.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Name: ", style: TextStyle(color: Colors.white)), // Static label
                    Text(product.name, style: const TextStyle(color: Colors.white)), // Product name
                  ],
                ),
                Row(
                  children: [
                    const Text("Category: ", style: TextStyle(color: Colors.white)), // Static label
                    Text(product.category, style: const TextStyle(color: Colors.white)), // Product category
                  ],
                ),
                Row(
                  children: [
                    const Text("Price: ", style: TextStyle(color: Colors.white)), // Static label
                    Text(product.price, style: const TextStyle(color: Colors.white)), // Product price
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductPage(
                      product: product,
                    ),
                  ),
                ),
                icon: const Icon(Icons.edit, color: Colors.white), // Icon color updated
              ),
              IconButton(
                onPressed: deleteProduct,
                icon: const Icon(Icons.delete, color: Colors.white), // Icon color updated
              ),
            ],
          )
        ],
      ),
    );
  }
}
