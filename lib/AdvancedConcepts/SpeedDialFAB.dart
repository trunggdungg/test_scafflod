import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class exSpeedDial extends StatefulWidget {
  const exSpeedDial({super.key});

  @override
  State<exSpeedDial> createState() => _exSpeedDialState();
}

class _exSpeedDialState extends State<exSpeedDial> {
  int _selectedIndex = 0;


  SpeedDial buildSpeedDial(){
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white70,
      visible: true,
      curve: Curves.bounceInOut,

      children: [
        SpeedDialChild(
          child: Icon(Icons.chrome_reader_mode, color: Colors.white,),
          backgroundColor: Colors.green,
          onTap: (){
            print('First FAB Clicked');
          },
          label: 'Read',
          labelStyle: TextStyle(fontWeight: FontWeight.w500 , color: Colors.white),
          labelBackgroundColor: Colors.black
        ),
        SpeedDialChild(

          // Write action icon
          child: Icon(Icons.create, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Write'),
          label: 'Write',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(

          // Code action icon
          child: Icon(Icons.laptop_chromebook, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Code'),
          label: 'Code',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Dial FAB Example'),
        backgroundColor: Colors.blue,
      ),
      
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: homeSpeedDial()),
          Center(child: Text('Gallery Page')),
          Center(child: Text('Profile Page')),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
          backgroundColor: Colors.blue,
          initialActiveIndex: _selectedIndex,
          activeColor: Colors.white,

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

  Widget homeSpeedDial(){
    return Center(
      child: Scaffold(
        floatingActionButton: buildSpeedDial(),

      ),
    );
  }
}
