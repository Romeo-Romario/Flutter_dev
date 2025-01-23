import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/adding');
            },
            child: Row(
              children: [
                Icon(
                  Icons.add_circle_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "add",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
