import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/order_provider.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final OrderItemModelProvider order;

  OrderItem({@required this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${widget.order.value}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          _expanded
              ? Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.order.products.length,
                      itemBuilder: (context, index) {
                        final product = widget.order.products[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0, left: 16, right: 16),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: 64,
                                  width: 64,
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 24),
                              Text(
                                '${product.quantity} x',
                              ),
                              SizedBox(width: 24),
                              Text(
                                product.title,
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '\$ ${(product.price * product.quantity).toStringAsFixed(2)}',
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              : Container(),
        ],
      ),
    );
  }
}
