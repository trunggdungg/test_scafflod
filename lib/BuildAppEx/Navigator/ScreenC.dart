import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screenC extends StatefulWidget {
  const screenC({super.key});

  @override
  State<screenC> createState() => _screenCState();
}

class _screenCState extends State<screenC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Screen C',
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 16,),

          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Back to Screen '))
        ],
      ),
    );
  }
}
