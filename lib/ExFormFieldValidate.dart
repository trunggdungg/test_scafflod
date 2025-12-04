import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class exFormFieldValidate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _exFormFieldValidateState();
  }
}

class _exFormFieldValidateState extends State<exFormFieldValidate> {
  //key
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  DateTime? _dateOfBirth;
  bool _obscurePassword = true;
  bool _isChecked = true;
  String? _fullName;
  String? _email;
  String? _gender;
  // list dropdown quốc gia
  final List<String> _cities = ["Việt Nam","Mỹ","Anh","Pháp","Đức","Nga"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Field Validate'),
        backgroundColor: Colors.yellow,
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

      body: Padding(

        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,// phải nằm trong widget Form
          child: SingleChildScrollView(
             child:  Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    label: Text("Nhập họ và tên."),
                    helperText: "Nhập đầy đủ họ và tên của bạn.",
                    hintText: "Nguyễn Văn A",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _fullNameController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (valueName){
                    if(valueName == null || valueName.isEmpty){
                      return "Vui lòng nhập họ và tên của bạn.";
                    }
                    return null;
                  },

                  onSaved: (fullNameValue){
                    _fullName = fullNameValue;
                  },
                ),
// Image picker
              FormField<File>(
                validator: (value) {
                  if (value == null) {
                    return 'Vui lòng chọn ảnh đại diện.';
                  }
                  return null;
                },
                builder: (FormFieldState<File> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Ảnh đại diện'),
                      SizedBox(height: 10),

                      // Ảnh đã chọn
                      if (state.value != null)
                        ClipOval(
                          child: Image.file(
                            state.value!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),

                      SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () async {
                          final XFile? pickedImage = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Chọn nguồn ảnh'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: Text('Thư viện'),
                                      onTap: () async {
                                        Navigator.pop(
                                          context,
                                          await ImagePicker().pickImage(
                                            source: ImageSource.gallery,
                                          ),
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Chụp ảnh'),
                                      onTap: () async {
                                        Navigator.pop(
                                          context,
                                          await ImagePicker().pickImage(
                                            source: ImageSource.camera,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );

                          if (pickedImage != null) {
                            state.didChange(File(pickedImage.path)); // QUAN TRỌNG
                          }
                        },
                        child: Text('Chọn ảnh'),
                      ),

                      if (state.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                },
              ),


              SizedBox(height: 20),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: Text("Nhập email."),
                    helperText: "Vui lòng nhập địa chỉ email của bạn.",
                    hintText: "nguyenvana@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _emailController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),

                  ),

                  onSaved: (valueEmail){
                    _email = valueEmail;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Vui lòng nhập email của bạn.";
                    }
                    //Kiểm tra định dạng email
                    String pattern =
                        r'^[^@]+@[^@]+\.[^@]+';
                    RegExp regex = RegExp(pattern);
                    if(!regex.hasMatch(value)){
                      return "Định dạng email không hợp lệ.";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: _passWordController,
                  decoration: InputDecoration(
                    label: Text("Nhập mật khẩu"),
                    hintText: "Mật khẩu của bạn",
                    helperText: "Độ dài từ 6-12 ký tự",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off

                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,// che mật khẩu
                  obscuringCharacter: '*',
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Vui lòng nhập mật khẩu.";
                    }
                    if(value.length < 6 || value.length > 12){
                      return "Độ dài mật khẩu từ 6-12 ký tự.";
                    }
                    return null;
                  },
                ),

                // Date of birth
                SizedBox(height: 16,),
                  TextFormField(
                    controller: _dateOfBirthController,
                      decoration: InputDecoration(
                        label: Text("Nhập ngày sinh"),
                        hintText: "DD/MM/YYYY",
                        prefixIcon: Icon(Icons.date_range),
                        suffixIcon: Icon(Icons.calendar_today),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),

                      ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025),
                      );

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        setState(() {
                          _dateOfBirth = pickedDate;
                          _dateOfBirthController.text = formattedDate;
                        });
                      }
                    },
                    keyboardType: TextInputType.datetime,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Vui lòng nhập ngày sinh.";
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 16,),

                DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text("Chọn quốc gia"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  items: _cities.map((city){
                    return DropdownMenuItem(
                        value: city,
                        child: Text(city)
                    );
                  })
                      .toList(),
                  onChanged: (value){},
                  validator: (value){
                    if(value == null){
                      return "Vui lòng chọn quốc gia.";
                    }
                    return null;
                  },
                ),

                // Radio button
                Column(
                  children: [
                    RadioListTile(
                      title: Text("Nam"),
                      value: "Nam",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Nữ"),
                      value: "Nữ",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),


                // check box
                SizedBox(height: 16),

                CheckboxListTile(
                  title: Text("Tôi đồng ý với các điều khoản dịch vụ."),
                  value: _isChecked,
                  onChanged: (value){
                    setState(() {
                      _isChecked = value!;
                      print("Đồng ý: $value");
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                SizedBox(height: 16,),

                //Row
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center, //Center dọc
                  mainAxisAlignment: MainAxisAlignment.center, //Center ngang
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data: $_fullName, $_email'),
                              )
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                      child: Text("Submit"),
                    ),

                    SizedBox(width: 15),
                    ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          _fullNameController.clear();
                          _emailController.clear();
                          _passWordController.clear();
                          _dateOfBirthController.clear();
                          setState(() {
                            _fullName = null;
                            _email = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        child: Text("Reset")),
                  ],
                ),
              ],
            ),
          ) ,

        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
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
