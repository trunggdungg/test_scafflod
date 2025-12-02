import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
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
      ),

      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),

              TextField(
                onSubmitted: (value) {
                  print('Bạn đã nhập xong: $value');
                },
                onChanged: (valueChanged) {
                  print('Giá trị đang thay đổi: $valueChanged');
                },
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'Email@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Nhập mật khẩu',
                  hintText: 'Mật khẩu của bạn',
                  helperText: 'Độ dài từ 6-12 ký tự',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue,
                ),
                obscureText: true,
                obscuringCharacter: '*',
              ),


              SizedBox(height: 15,),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Nhập vào số điện thoại',
                  hintText: '03427*****',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nhập vào ngày tháng năm sinh',
                  hintText: 'DD/MM/YYYY',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating Action Button Pressed');
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
      ),
    );
  }
}
