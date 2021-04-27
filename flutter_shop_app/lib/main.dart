import 'package:flutter/material.dart';
import 'package:flutter_shop_app/presentation/cart_screen.dart';
import 'package:flutter_shop_app/presentation/producs_overview_screen.dart';
import 'package:flutter_shop_app/presentation/product_detail_screen.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import './providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // here we use builder for the provider because we are not reusing the
          // items we need but creating new instances of the item we need
          create: (BuildContext context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'My Shop App',
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato'),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          }),
    );
  }
}
