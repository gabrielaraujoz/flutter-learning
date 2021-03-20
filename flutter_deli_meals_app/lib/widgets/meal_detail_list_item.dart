import 'package:flutter/material.dart';

class MealDetailListItem extends StatelessWidget {
  const MealDetailListItem({
    Key key,
    @required this.listItems,
  }) : super(key: key);

  final List<String> listItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (ctx, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          elevation: 0,
          child: Text(
            listItems[index],
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          ),
        ),
        itemCount: listItems.length,
      ),
    );
  }
}
