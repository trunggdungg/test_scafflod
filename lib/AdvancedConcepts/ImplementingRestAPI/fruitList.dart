import 'package:flutter/material.dart';

import 'fruit.dart';
import 'fruitItem.dart';

class FruitList extends StatelessWidget {
  final List<Fruit> items;

  const FruitList({Key? key, required this.items,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FruitItem(item: items[index]);
      },
    );
  }
}