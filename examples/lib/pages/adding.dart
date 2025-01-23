import 'package:flutter/material.dart';

class AddingEl extends StatefulWidget {
  const AddingEl({super.key});

  @override
  State<AddingEl> createState() => _AddingElState();
}

class _AddingElState extends State<AddingEl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text("Add the element"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text('Adding screen'),
    );
  }
}
