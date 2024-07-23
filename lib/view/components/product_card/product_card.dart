import 'package:banner/controller/add_to_cart_provider.dart';
import 'package:banner/view/pages/productpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.0, // Adjust height as needed
              width: double.infinity,
              child: Image.network(
                // Network image URL
                product.imageurl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: cross,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Rs. ${product.price}',
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Consumer<AddToCartProvider>(
                      builder: (context, cartProvider, child) => IconButton(
                        icon: const Icon(
                          Icons.add_shopping_cart_rounded,
                        ),
                        onPressed: () {
                          cartProvider.addProductToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(
                                milliseconds: 800,
                              ),
                              content: Text(
                                "Item added to cart!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
            )
          ],
        ),
      ),
    );
  }
}
