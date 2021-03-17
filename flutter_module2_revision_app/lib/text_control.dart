import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TextControl extends StatelessWidget {
  final Function updateWord;

  TextControl(this.updateWord);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Change Word", style: TextStyle(fontSize: 16),),
      onPressed: updateWord,
      color: Colors.blueAccent,
      textColor: Colors.white,
    );
  }
}
