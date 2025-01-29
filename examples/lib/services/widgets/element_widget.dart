import 'package:flutter/material.dart';
import 'package:examples/services/models/book_info.dart';

class ElementWidget extends StatelessWidget {
  final BookInfo element;

  ElementWidget({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(element.title),
        subtitle: Text(element.text),
        leading: Image.asset(element.imagePath),
      ),
    );
  }
}
