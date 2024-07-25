import 'package:banner/controller/add_to_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AddToCartProvider>(
          builder: (context, cartProvider, child) {
            return cartProvider.cartItems.isEmpty
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/cart.png'),
                        filterQuality: FilterQuality.low,
                        height: 300,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your Cart is Empty.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartProvider.cartItems.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image.network(
                                      cartProvider.cartItems[index].imageurl),
                                  title:
                                      Text(cartProvider.cartItems[index].name),
                                  subtitle: Text(
                                      'Rs.${cartProvider.cartItems[index].price}'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                        onPressed: () {
                                          cartProvider.removeProductFromCart(
                                              cartProvider.cartItems[index]);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              content: Text(
                                                "Item Remove From Cart!",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        onPressed: () {
                                          cartProvider.addProductToCart(
                                              cartProvider.cartItems[index]);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              content: Text(
                                                "Item added to Cart!",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider()
                              ],
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Rs. ${cartProvider.totalPrice}',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Checkout functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade300,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
