import 'package:flutter/material.dart';
import 'package:examples/services/widgets/element_widget.dart';
import 'package:examples/services/models/book_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BookInfo> cards = [
    BookInfo.defaultAsset(
        title: "First one", text: "It was a time long ago I was free"),
    BookInfo.defaultAsset(
        title: "Second one", text: "Non cool cloth no good shoes, and no TV"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: cards.map((el) => BookInfoView(element: el)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, "/adding");
          if (result == null) {
            return;
          }
          setState(() {
            cards.add(result as BookInfo);
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.deepPurple,
          size: 30,
        ),
      ),
    );
  }
}
