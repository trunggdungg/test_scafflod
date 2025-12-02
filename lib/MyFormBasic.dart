import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormBasicDemoState();
  }
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  // sử dụng global key để xác định form
  final _formKey = GlobalKey<FormState>();
  String? _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Scaffold'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.safety_check)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        backgroundColor: Colors.yellow,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        //Form là widget cha của các trường nhập liệu
        //key được sử dụng để truy cập và quản lý trạng thái của biểu mẫu
        // Phương thức validate() được sử dụng để kiểm tra tính hợp lệ của tất cả các trường nhập liệu trong biểu mẫu
        // Phương thức save() được sử dụng để lưu trữ dữ liệu từ tất cả các trường nhập liệu trong biểu mẫu
        // Phương thức reset() được sử dụng để đặt lại tất cả các trường nhập liệu trong biểu mẫu về giá trị ban đầu của chúng
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nhập tên của bạn',
                  hintText: 'Tên đầy đủ',
                  helperText: 'Vui lòng nhập tên của bạn',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                onChanged: (valueChanged) {
                  _name = valueChanged;

                },
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data: $_name')));
                    }
                  }, child: Text('Submit')),
                  SizedBox(width: 16),
                  ElevatedButton(onPressed: () {
                    _formKey.currentState!.reset();
                    setState(() {
                      _name = null;
                    });
                  }, child: Text('Reset')),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar:BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'),
      ],
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
