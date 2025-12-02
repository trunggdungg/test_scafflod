import 'package:flutter/material.dart';

class Mytextfield2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Mytextfield2State();
  }
}

class _Mytextfield2State extends State<Mytextfield2> {
  final _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Scaffold'),
        actions: [
          IconButton(
            onPressed: () {
              print("icon search");
            },
            icon: Icon(Icons.search),
          ),

          IconButton(
            onPressed: () {
              print("oke");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: Colors.grey,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 15),

            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nhập thông tin',
                hintText: 'Hãy nhập gì đó',
                helperText: 'Vui lòng nhập thông tin vào ô trên',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
              onChanged: (valueChanged) {
                setState(() {
                  _inputText = valueChanged;
                });
              },
            ),

            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nhập ho ten',
                hintText: 'Nhập họ tên của bạn',
                helperText: 'Độ dài từ 6-12 ký tự',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.clear),
                filled: true,
                fillColor: Colors.blue[50],
              ),
            ),
            
            SizedBox(height: 15),
            Text('Bạn đã nhập: $_inputText'),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Đây là floating button!");
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        backgroundColor: Colors.blue,
      ),
    );
  }
}
