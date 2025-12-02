import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Scaffold'),
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


      backgroundColor: Colors.grey,


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Hello, Scaffold!')),
          
          ElevatedButton(
              onPressed: (){
                print('Elevated Button Pressed');
              },
              onLongPress: () {
                print('Elevated Button Long Pressed');
              },

              child: Text("Hãy nhấn tôi")),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating Action Button Pressed');
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
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
