import 'package:flutter/material.dart';
import '../model/User.dart';
import 'UserFormScreen.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết người dùng")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 20),
            Text("Tên: ${user.name}", style: TextStyle(fontSize: 18)),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 16)),
            Text("SĐT: ${user.phone}", style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => UserFormScreen(user: user)),
                );
              },
              child: Text("Sửa"),
            )
          ],
        ),
      ),
    );
  }
}
