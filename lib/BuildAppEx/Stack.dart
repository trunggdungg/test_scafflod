import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class stackEx extends StatefulWidget {
  const stackEx({super.key});

  @override
  State<stackEx> createState() => _stackExState();
}

class _stackExState extends State<stackEx> {
  int _selectedIndex = 0;
  bool _favorite = false;
  bool _favorite2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Example'),
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [stackExx(), stack2Ex(),Text('tets')],
      ),

      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Colors.blue,
        activeColor: Colors.white,
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Messages'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  ///stack
  Widget stackExx() {
    return Stack(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      children: [
        Center(child: Container(width: 200, height: 200, color: Colors.red)),
        Container(width: 150, height: 150, color: Colors.green),
        Positioned(
          right: 20,
          child: Container(width: 100, height: 100, color: Colors.blue),
        ),
      ],
    );
  }

  Widget stack2Ex() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network('https://placehold.co/600x400/png'),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _favorite = !_favorite;
                    });
                  },
                  icon: Icon(
                    _favorite ? Icons.favorite : Icons.favorite_border,
                    color: _favorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Image.network('https://placehold.co/600x400/png'),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _favorite2 = !_favorite2;
                    });
                  },
                  icon: Icon(
                    _favorite2 ? Icons.favorite : Icons.favorite_border,
                    color: _favorite2 ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(50),
                child: Image.network(
                  'https://placehold.co/600x400/png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 6,
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
