import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
            Card(
              child: Text('List of TX'),
            ),
          ],
        ));
  }
}
