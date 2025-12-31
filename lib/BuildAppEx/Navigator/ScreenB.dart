import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_scafflod/BuildAppEx/Navigator/ScreenC.dart';

class screenB extends StatefulWidget {
  const screenB({super.key});

  @override
  State<screenB> createState() => _screenBState();
}

class _screenBState extends State<screenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Screen B',
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 16,),

          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Back to Screen A')),

          ElevatedButton(
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> screenC()));
              },
              child: Text('Go to Screen C'))
        ],
      ),
    );
  }
}
