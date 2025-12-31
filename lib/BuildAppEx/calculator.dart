import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calculatorEx extends StatefulWidget {
  const calculatorEx({super.key});

  @override
  State<calculatorEx> createState() => _calculatorExState();
}

class _calculatorExState extends State<calculatorEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Example'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _calculatorWidget('7'),
                SizedBox(width: 18,),
                _calculatorWidget('8'),
                SizedBox(width: 18,),
                _calculatorWidget('9'),
                SizedBox(width: 18,)
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _calculatorWidget('7'),
                SizedBox(width: 18,),
                _calculatorWidget('8'),
                SizedBox(width: 18,),
                _calculatorWidget('9'),
                SizedBox(width: 18,)
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _calculatorWidget('7'),
                SizedBox(width: 18,),
                _calculatorWidget('8'),
                SizedBox(width: 18,),
                _calculatorWidget('9'),
                SizedBox(width: 18,)
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _calculatorWidget('7'),
                SizedBox(width: 18,),
                _calculatorWidget('8'),
                SizedBox(width: 18,),
                _calculatorWidget('9'),
                SizedBox(width: 18,)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _calculatorWidget(String value) {
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),

      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
