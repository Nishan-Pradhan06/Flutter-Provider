import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/fav_provider.dart';
import '../components/product_card/product_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text(
          'Favouries',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          if (favoriteProvider.favorites.isEmpty) {
            return const Center(
              child: Text('No favorite products.'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: favoriteProvider.favorites.length,
            itemBuilder: (context, index) {
              return ProductCard(product: favoriteProvider.favorites[index]);
            },
          );
        },
      ),
    );
  }
}
