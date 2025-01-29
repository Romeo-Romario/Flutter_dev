import 'package:examples/services/models/image_source_type.dart';
import 'package:flutter/material.dart';
import 'package:examples/services/models/book_info.dart';
import 'dart:io';

class BookInfoView extends StatelessWidget {
  final BookInfo element;

  BookInfoView({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(element.title),
        subtitle: Text(element.text),
        leading: switch (element.imageSource) {
          ImageSourceType.asset => Image.asset(element.imagePath),
          ImageSourceType.web => Image.network(element.imagePath),
          ImageSourceType.local => Image.file(File(element.imagePath)),
        },
      ),
    );
  }
}
