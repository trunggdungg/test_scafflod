import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';

class lottieAnimation extends StatefulWidget {
  const lottieAnimation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _lottieAnimationState();
  }
}

class _lottieAnimationState extends State<lottieAnimation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Lottie Animation Example'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: lottieAnimationTab()),
          Center(child: Text('Message Page')),
          Center(child: Text('Profile Page')),
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

  Widget lottieAnimationTab() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Transform.scale(
              scaleX: -1,
              child: Lottie.asset(
                'assets/animations/loading_animation.json',
                height: 300,
                repeat: true,
                reverse: false,
                animate: true,
              ),
            ),

            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
              height: 200,
              repeat: true,
              reverse: true,
              animate: true,
            ),
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
