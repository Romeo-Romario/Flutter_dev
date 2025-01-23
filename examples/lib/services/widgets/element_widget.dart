import 'package:flutter/material.dart';
import 'package:examples/services/classes/el.dart';

class ElementWidget extends StatelessWidget {
  final El element;

  ElementWidget({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(element.imagePath),
              width: 40,
            ),
            Column(
              children: [
                Text(
                  element.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  element.text,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
