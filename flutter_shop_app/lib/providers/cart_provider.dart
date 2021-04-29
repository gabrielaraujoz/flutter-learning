import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItemModelProvider {
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
  final String cartProductId;

  CartItemModelProvider({
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.imageUrl,
    @required this.cartProductId,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItemModelProvider> _items = {};

  Map<String, CartItemModelProvider> get items {
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
        (existingCartItem) => CartItemModelProvider(
          cartProductId: existingCartItem.cartProductId,
          productId: existingCartItem.productId,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItemModelProvider(
          cartProductId: DateTime.now().toString(),
          productId: productId,
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
