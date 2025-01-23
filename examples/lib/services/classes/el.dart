import 'package:flutter/material.dart';

class El {
  final String title;
  final String text;
  final String imagePath;

  El({
    required this.title,
    this.text = '',
    this.imagePath = 'assets/images/default.png',
  });
}
