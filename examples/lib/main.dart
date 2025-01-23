import 'package:flutter/material.dart';
import 'package:examples/pages/adding.dart';
import 'package:examples/pages/loading.dart';
import 'package:examples/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/adding': (contex) => AddingEl(),
    },
  ));
}
