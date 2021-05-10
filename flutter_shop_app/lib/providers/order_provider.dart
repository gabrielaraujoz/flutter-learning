import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:flutter_shop_app/widgets/cart_item.dart';

class OrderItemModelProvider {
  final String id;
  final double value;
  final List<CartItemModelProvider> products;
  final DateTime dateTime;

  OrderItemModelProvider({
    @required this.id,
    @required this.value,
    @required this.products,
    @required this.dateTime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderItemModelProvider> _orders = [];

  List<OrderItemModelProvider> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItemModelProvider> cartProducts, double totalValue) {
    _orders.insert(
      0,
      OrderItemModelProvider(
        id: DateTime.now().toString(),
        value: totalValue,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
