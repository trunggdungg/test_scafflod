import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/user_database_helper.dart';
import '../models/user.dart';
class UserAddScreen2 extends StatefulWidget{
  final User? user;
  const UserAddScreen2({super.key, this.user});
  @override
  State<UserAddScreen2> createState() => _UserAddScreenState();
}


class _UserAddScreenState extends State<UserAddScreen2>{
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _ageController;

  bool get isEdit => widget.user != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.user?.name ?? '',
    );
    _ageController = TextEditingController(
      text: widget.user?.age.toString() ?? '',
    );
  }
  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final user = User(
      widget.user?.id, // giữ id khi edit
      name: _nameController.text.trim(),
      age: int.parse(_ageController.text),
    );

    if (isEdit) {
      await UserDatabaseHelper2.instance.updateUser(user);
    } else {
      await UserDatabaseHelper2.instance.insertUser(user);
    }

    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit User' : 'Add User'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// NAME
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name không được để trống';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              /// AGE
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age không được để trống';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Age phải là số';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(isEdit ? 'Update' : 'Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}