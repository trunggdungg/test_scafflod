import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HingeAnimationExamplePage extends StatefulWidget {
  const HingeAnimationExamplePage({super.key});

  @override
  State<HingeAnimationExamplePage> createState() =>
      _HingeAnimationExamplePageState();
}

class _HingeAnimationExamplePageState extends State<HingeAnimationExamplePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text("GeeksForGeeks"),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Container(
            margin: EdgeInsets.only(left: 100, top: _slideAnimation.value),
            child: RotationTransition(
              alignment: Alignment.topLeft,
              turns: _rotationAnimation,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: const Text(
                  'GeeksForGeeks',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reset();
          }
          _controller.forward();
        },
      ),
    );
  }
}
