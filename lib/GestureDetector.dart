import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDemo  extends StatelessWidget {
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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15,),

            GestureDetector(
             onTap: (){
               print('On Tap');
             },
              onDoubleTap: (){
                print('On Double Tap');
              },

             //drag
              onPanUpdate: (details){
                print('On Pan Update: ${details.delta}');
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(child: Text('Hãy nhấn tôi!')),
              ),
              
            )
          ],
        ),
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
