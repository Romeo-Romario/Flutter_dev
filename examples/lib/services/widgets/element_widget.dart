import 'package:auto_size_text/auto_size_text.dart';
import 'package:examples/services/models/image_source_type.dart';
import 'package:examples/services/widgets/element_display.dart';
import 'package:flutter/material.dart';
import 'package:examples/services/models/book_info.dart';
import 'dart:io';

class BookInfoView extends StatelessWidget {
  final BookInfo element;

  BookInfoView({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ElementDisplay(bookInfo: element)),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        // child: ListTile(
        //   title: Text(element.title),
        //   subtitle: Text(element.text),
        //   leading: switch (element.imageSource) {
        //     ImageSourceType.asset => Image.asset(element.imagePath),
        //     ImageSourceType.web => Image.network(element.imagePath),
        //     ImageSourceType.local =>
        //       Image(image: FileImage(File(element.imagePath))),
        //   },
        // ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 100,
                width: double.infinity,
                child: switch (element.imageSource) {
                  ImageSourceType.asset => Image.asset(element.imagePath),
                  ImageSourceType.web => Image.network(element.imagePath),
                  ImageSourceType.local =>
                    Image(image: FileImage(File(element.imagePath))),
                },
              ),
              AutoSizeText(
                element.title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              AutoSizeText(
                element.text,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                minFontSize: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
