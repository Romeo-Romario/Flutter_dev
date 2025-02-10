// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:examples/services/models/image_source_type.dart';
import 'package:flutter/material.dart';
import 'package:examples/services/models/book_info.dart';

class ElementDisplay extends StatelessWidget {
  const ElementDisplay({super.key, required this.bookInfo});

  final BookInfo bookInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Element"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                child: switch (bookInfo.imageSource) {
                  ImageSourceType.asset => Image.asset(bookInfo.imagePath),
                  ImageSourceType.web => Image.network(bookInfo.imagePath),
                  ImageSourceType.local =>
                    Image(image: FileImage(File(bookInfo.imagePath))),
                },
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    child: Text(
                      bookInfo.title,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black, width: 2.0)),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    bookInfo.text,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: bookInfo.text.isEmpty
                            ? Colors.transparent
                            : Colors.black,
                        width: 2.0)),
              ),
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
