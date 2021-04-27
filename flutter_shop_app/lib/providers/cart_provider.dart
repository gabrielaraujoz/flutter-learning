import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItemProvider {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItemProvider({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.imageUrl,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItemProvider> _items = {};

  Map<String, CartItemProvider> get items {
    return {..._items};
  }

  int get totalItems {
    var totalCount = 0;
    _items.forEach((key, cartItem) {
      totalCount += cartItem.quantity;
    });
    return totalCount;
  }

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String imageUrl,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItemProvider(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItemProvider(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }
}
