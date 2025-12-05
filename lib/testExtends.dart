import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A")),
      body: Center(
        child: ChildB(), // 👈 Gọi widget con
      ),
    );
  }
}

class ChildB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Tôi là widget B");
  }
}
