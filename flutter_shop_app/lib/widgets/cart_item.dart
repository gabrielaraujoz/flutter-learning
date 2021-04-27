import 'package:flutter/material.dart';
import 'package:flutter_shop_app/presentation/product_detail_screen.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  const CartItem(
      {Key key, @required this.id, @required this.price, @required this.quantity, @required this.title, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('$quantity x', style: Theme.of(context).primaryTextTheme.headline6,),
          ),
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
            Text(
              '\$${price.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
            ),
          ]),
          trailing: Text('\$ ${(price * quantity).toStringAsFixed(2)}', style: Theme.of(context).primaryTextTheme.headline6,),
        ),
      ),
    );
  }
}