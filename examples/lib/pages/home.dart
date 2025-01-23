import 'package:flutter/material.dart';
import 'package:examples/services/widgets/element_widget.dart';
import 'package:examples/services/classes/el.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<El> cards = [
    El(title: "First one", text: "It was a time long ago I was free"),
    El(title: "Second one", text: "Non cool cloth no good shoes, and no TV"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: cards.map((el) => ElementWidget(element: el)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/adding");
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
