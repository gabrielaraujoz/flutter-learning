import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TextWidget extends StatelessWidget {
  final WordPair word;

  TextWidget(this.word);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        word.asPascalCase,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}
