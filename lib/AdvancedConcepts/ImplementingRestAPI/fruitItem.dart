import 'package:flutter/material.dart';
import 'fruit.dart';

class FruitItem extends StatelessWidget {
  FruitItem({required this.item});

  final Fruit item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              item.imgUrl,
              width: 200,
              errorBuilder: (context, error, stackTrace) {

                // Placeholder for error handling
                return Icon(Icons.error);
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("id: ${item.id}"),
                    Text("quantity: ${item.quantity}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}