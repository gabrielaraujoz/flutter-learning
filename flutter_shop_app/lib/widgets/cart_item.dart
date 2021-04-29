import 'package:flutter/material.dart';
import 'package:flutter_shop_app/presentation/product_detail_screen.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;
  final String cartProductId;

  const CartItem(
      {Key key,
      @required this.productId,
      @required this.price,
      @required this.quantity,
      @required this.title,
      @required this.imageUrl,
      @required this.cartProductId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartProductId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 20,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CartProvider>(
          context,
          listen: false,
        ).removeItem(productId);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: productId,
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
                child: Text(
                  '$quantity x',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
              trailing: Text(
                '\$ ${(price * quantity).toStringAsFixed(2)}',
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
