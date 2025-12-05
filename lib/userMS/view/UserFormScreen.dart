import 'package:flutter/material.dart';
import '../db/UserDatabaseHelper.dart';
import '../model/User.dart';

class UserFormScreen extends StatefulWidget {
  final User? user; // null = thêm mới, khác null = sửa

  const UserFormScreen({this.user});

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.user?.name ?? "");
    _emailController = TextEditingController(text: widget.user?.email ?? "");
    _phoneController = TextEditingController(text: widget.user?.phone ?? "");
  }

  Future<void> _saveUser() async {
    if (!_formKey.currentState!.validate()) return;

    final newUser = User(
      id: widget.user?.id,
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      avatar: null,
      dateOfBirth: DateTime.now(),
    );

    if (widget.user == null) {
      await UserDatabaseHelper.instance.insertUser(newUser);
    } else {
      await UserDatabaseHelper.instance.updateUser(newUser);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? "Thêm người dùng" : "Sửa người dùng"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Tên"),
                validator: (value) =>
                value == null || value.isEmpty ? "Không được bỏ trống" : null,
              ),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) =>
                value == null || value.isEmpty ? "Không được bỏ trống" : null,
              ),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Số điện thoại"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _saveUser,
                child: Text("Lưu"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
