import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class restrictLandscape extends StatefulWidget {
  const restrictLandscape({super.key});

  @override
  State<restrictLandscape> createState() => _restrictLandscapeState();
}

class _restrictLandscapeState extends State<restrictLandscape> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    /// có thể thay đổi landscapeRight thành landscapeLeft
    /// để khóa chế độ ngang theo hướng khác
    return Scaffold(
      appBar: AppBar(
        title: Text('Restrict Landscape Example'),
        backgroundColor: Colors.blue,
      ),


      body: IndexedStack(
        index: _selectedIndex,
        children: [
          restrictLandscapeTab(),
          Center(child: Text('Gallery Page')),
          Center(child: Text('Profile Page')),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          initialActiveIndex: _selectedIndex,
          activeColor: Colors.white,
          style: TabStyle.react,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.photo, title: 'Gallery'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ]),
    );
  }


  Widget restrictLandscapeTab(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is an example of restricting landscape mode.'),
        ],
      ),
    );
  }
}
