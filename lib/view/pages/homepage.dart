import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'cart.dart';
import '../components/product_card/product_card.dart';
import '../components/slider/slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Product> products = [
    Product(
      name: 'MacBook Air',
      price: 29.99,
      description: "Mac Book air best selling Laptops.",
      imageurl:
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-macbook-air-space-gray-m1-202010?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1634145627000',
    ),
    Product(
      name: 'Iphone 15',
      price: 49.99,
      description: "A powerful and efficient laptop for professionals.",
      imageurl:
          'https://99mobilebn.com/wp-content/uploads/2023/11/iPhone-15-Pro-Max-06.png',
    ),
    Product(
      name: 'DJI Mini 4 Pro',
      price: 59.99,
      description: "A versatile laptop suitable for gaming and work.",
      imageurl:
          'https://www.droneworld.co.za/wp-content/uploads/2023/09/dji_cp_ma_00000740_01_mini_4_pro_drone_1784785.jpg',
    ),
    Product(
      name: 'T-Motor KV360',
      price: 59.99,
      description: "A versatile laptop suitable for gaming and work.",
      imageurl:
          'https://i.pinimg.com/564x/8c/fa/df/8cfadf6804093f07d7ac16b6b303b18c.jpg',
    ),
    // Add more products as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text(
          'HOME PAGE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: products)));
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ImageSlider(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio:
                    0.7, // Adjust to fit your ProductCard dimensions
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(product: products[index]);
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: CustomFloatingActionButton(
      //   onAddProduct: _addProduct, // Pass the _addProduct function
      // ),
    );
  }
}
