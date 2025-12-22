import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fruit.dart';
import 'fruitList.dart';

class homePageEx extends StatefulWidget {
  const homePageEx({super.key});

  @override
  State<homePageEx> createState() => _homePageExState(products: fetchFruit());
}

class _homePageExState extends State<homePageEx> {
  final String title;
  final Future<List<Fruit>> products;

  _homePageExState({this.title = "GeeksForGeeks", required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4CAF50),
        title: Text("GeeksForGeeks"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                // Refresh the product list
                fetchFruit();
              });
            },
          ),
          IconButton(
            onPressed: () {
              // More options action
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Fruit>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? FruitList(items: snapshot.data!)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Future<List<Fruit>> fetchFruit() async {
  await Future.delayed(const Duration(seconds: 2));

  return [
    Fruit(
      id: 1,
      title: "Apple",
      imgUrl: "https://placehold.co/600x400/orange/white",
      quantity: 10,
    ),
    Fruit(
      id: 2,
      title: "Banana",
      imgUrl: "https://placehold.co/600x400",
      quantity: 20,
    ),
  ];
}
