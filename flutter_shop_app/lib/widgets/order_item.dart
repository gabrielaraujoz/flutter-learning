import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_shop_app/providers/order_provider.dart';

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
    return Card(margin: EdgeInsets.all(10), child: Column(
      children: [
        ListTile(
          title: Text('\$ ${widget.order.value}'),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),),
          trailing: IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more), onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
          },),
        ),
        _expanded ? Container() : Container()
      ],
    ),);
  }
}
