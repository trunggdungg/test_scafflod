import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_scafflod/BuildAppEx/Navigator/ScreenB.dart';

class screenA extends StatefulWidget {
  const screenA({super.key});

  @override
  State<screenA> createState() => _screenAState();
}

class _screenAState extends State<screenA> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: navigatorScreenB()),
          Center(child: Text('Message'),),
          Center(child: Text('Profile'),),
        ],
      ),

        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
            backgroundColor: Colors.blue,
            activeColor: Colors.white,
            initialActiveIndex: _selectedIndex,
            onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
            },
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.message, title: 'Message'),
              TabItem(icon: Icons.person, title: 'Profile'),
            ]),
    );
  }


  Widget navigatorScreenB(){
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => screenB()));
          },
          child: Text('Go to Screen B')),
    );
  }
}
