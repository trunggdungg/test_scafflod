import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ExRoutesAndNavigator extends StatefulWidget {
  const ExRoutesAndNavigator({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExRoutesAndNavigatorState();
  }
}

class _ExRoutesAndNavigatorState
    extends State<ExRoutesAndNavigator> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animation Route Transition Example'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: homeNavigatorFlutter() ),
          Center(child:  Text('') ),
          Center(child: Text('') ),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,

        ///type
        style: TabStyle.react,
        activeColor: Colors.white,
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  Widget homeNavigatorFlutter(){
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          foregroundColor: Colors.white70
        ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return SecondRoute();
                })
            );
          },
          child: Text('Go to Page 2')),
    );
  }


  Widget SecondRoute(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white70,
        ///có thể custom icon back bằng leading
        leading: IconButton(
            onPressed: () {
                Navigator.pop(context);
            },
            icon: Icon(Icons.back_hand)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back Home'),
        ),
      ),
    );
  }

}

