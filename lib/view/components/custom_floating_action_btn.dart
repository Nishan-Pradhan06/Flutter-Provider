import 'package:banner/view/components/addProducts/add_product.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onAddProduct});

  final Function(Product) onAddProduct;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddProductPage(
              onAddProduct: onAddProduct,
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
