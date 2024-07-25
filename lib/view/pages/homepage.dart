import 'package:banner/const/product_list.dart';
import 'package:banner/view/pages/fav_page.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import '../components/product_card/product_card.dart';
import '../components/slider/slider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsList = productsLists();
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
        leading: IconButton(
          icon: const Icon(
            Icons.favorite_rounded,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritePage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
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
                  return ProductCard(product: productsList.products[index]);
                },
                childCount: productsList.products.length,
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
