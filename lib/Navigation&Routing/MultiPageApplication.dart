import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ExMultiPageApplication extends StatefulWidget {
  const ExMultiPageApplication({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExMultiPageApplicationState();
  }
}

class _ExMultiPageApplicationState extends State<ExMultiPageApplication> {
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
          Center(child: homeNavigatorFlutter()),
          Center(child: Text('')),
          Center(child: Text('')),
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

  Widget homeNavigatorFlutter() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white70,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Click me'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white70,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: Text('Tap me'),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Back to home')),
      ),
    );
  }
}


class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Tap me page')),
      ),
    );
  }
}
