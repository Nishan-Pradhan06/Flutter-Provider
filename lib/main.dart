import 'package:banner/controller/fav_provider.dart';
import 'package:banner/controller/image_slider_provider.dart';
import 'package:flutter/material.dart';
import 'controller/add_to_cart_provider.dart';
import 'view/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImagesliderProvider()),
        ChangeNotifierProvider(create: (_) => AddToCartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learning Provider',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
