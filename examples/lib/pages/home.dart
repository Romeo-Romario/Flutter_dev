import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:examples/services/widgets/element_widget.dart';
import 'package:examples/services/models/book_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BookInfo> cards = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        actions: [
          TextButton(
            onPressed: clearData,
            child: Icon(Icons.delete_forever_rounded),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
            primary: false,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 16.0, // Vertical spacing between grid items
              crossAxisSpacing: 16.0, // Horizontal spacing between grid items
              childAspectRatio:
                  3 / 4, // Width-to-height ratio (adjust for taller items)
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final element = cards[index];
              // return cards.map((el) => BookInfoView(element: el)).toList(),}
              return BookInfoView(element: element);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, "/adding");
          if (result == null) {
            return;
          }
          setState(() {
            cards.add(result as BookInfo);
            saveData();
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

  void loadData() async {
    final SharedPreferencesWithCache prefsWithCache =
        await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: {"book_list"},
      ),
    );

    // Get JSON string from SharedPreferences
    String? jsonString = prefsWithCache.getString("book_list");

    if (jsonString != null) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      setState(() {
        cards = jsonData.map((e) => BookInfo.fromJson(e)).toList();
      });
    } else {
      setState(() {
        cards = [
          BookInfo.defaultAsset(
              title: "First one", text: "It was a time long ago I was free"),
          BookInfo.defaultAsset(
              title: "Second one",
              text: "Non cool cloth no good shoes, and no TV"),
        ];
      });
    }
  }

  void saveData() async {
    final SharedPreferencesWithCache prefsWithCache =
        await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: {"book_list"},
      ),
    );

    // Convert List<BookInfo> to JSON String
    String jsonString = jsonEncode(cards.map((e) => e.toJson()).toList());

    // Save JSON string in SharedPreferences
    await prefsWithCache.setString("book_list", jsonString);
  }

  void clearData() async {
    final SharedPreferencesWithCache prefsWithCache =
        await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: {"book_list"},
      ),
    );
    setState(() {
      prefsWithCache.clear();
      cards = [
        BookInfo.defaultAsset(
            title: "First one", text: "It was a time long ago I was free"),
        BookInfo.defaultAsset(
            title: "Second one",
            text: "Non cool cloth no good shoes, and no TV"),
      ];
    });
  }
}
