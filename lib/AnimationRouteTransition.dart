import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class animationRouteTransitionEx extends StatefulWidget {
  const animationRouteTransitionEx({super.key});

  @override
  State<StatefulWidget> createState() {
    return _animationRouteTransitionExState();
  }
}

class _animationRouteTransitionExState extends State<animationRouteTransitionEx> {
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
          Center(child: goToPage2Button()),
          Center(child: exInkWellButton()),
          Center(child: Text("Xin chào 2"),)
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
          ]),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  Widget goToPage2Button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        /// Navigate to Page 2 with a custom transition
        // Navigator.push(context,
        //  MaterialPageRoute(
        //      builder: (context) {
        //         return const Page2();
        //      })
        // );

        ///hoặc dùng cách này để tạo hiệu ứng chuyển trang
        Navigator.of(context).push(_createRoute());
      },
      child: const Text('Go to Page 2', style: TextStyle(color: Colors.white)),
    );
  }

  Widget exInkWellButton(){
    return InkWell(
      onTap: (){
        print('Xin chào InkWell');
        ScaffoldMessenger.of(context).showSnackBar(

          SnackBar(content: Text('Xin chào InkWell'))
        );
      },
      onLongPress: (){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Bạn đã nhấn giữ InkWell'))
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('InkWell Button', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Page 2')),
    );
  }
}


