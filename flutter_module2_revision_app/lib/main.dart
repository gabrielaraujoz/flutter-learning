import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_module2_revision_app/text_control.dart';
import 'package:flutter_module2_revision_app/text_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __MyAppState();
  }
}

class __MyAppState extends State<MyApp> {
  var wordPair = WordPair.random();

  void _resetWordPair() {
    setState(() {
      wordPair = WordPair.random();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Module 2 - Revision App'),
      ),
      body: Center(
        child: Column(
          children: [
            TextWidget(wordPair),
            TextControl(_resetWordPair),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    ));
  }
}
