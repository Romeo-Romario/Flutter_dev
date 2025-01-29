import 'package:examples/services/models/image_source_type.dart';
import 'package:flutter/material.dart';

class BookInfo {
  final String title;
  final String text;
  final String imagePath;
  final ImageSourceType imageSource;

  BookInfo({
    required this.title,
    required this.text,
    required this.imagePath,
    required this.imageSource,
  });

  BookInfo.defaultAsset({
    required this.title,
    this.text = '',
  })  : imagePath = 'assets/images/default.png',
        imageSource = ImageSourceType.asset;

  BookInfo.asset({
    required this.title,
    required this.text,
    required this.imagePath,
  }) : imageSource = ImageSourceType.asset;

  BookInfo.local({
    required this.title,
    required this.text,
    required this.imagePath,
  }) : imageSource = ImageSourceType.local;

  BookInfo.web({
    required this.title,
    required this.text,
    required this.imagePath,
  }) : imageSource = ImageSourceType.web;
}
