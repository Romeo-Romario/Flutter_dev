import 'package:flutter/material.dart';

class lyricCard extends StatelessWidget {
  final String lyric;
  lyricCard({required this.lyric});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            lyric,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ));
  }
}
