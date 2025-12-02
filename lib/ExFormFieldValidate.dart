import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class exFormFieldValidate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _exFormFieldValidateState();
  }
}

class _exFormFieldValidateState extends State<exFormFieldValidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Field Validate'),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
            onPressed: () {
              print("icon search");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("oke");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
