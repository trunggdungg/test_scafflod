import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExampleTest2 extends StatefulWidget {
  const ExampleTest2({super.key});

  @override
  State<StatefulWidget> createState() => _ExampleTest2State();
}

class _ExampleTest2State extends State<ExampleTest2> {
  /// FORM CONTROLLERS
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _passwordController = TextEditingController();

  /// FORM VALUES
  bool _passwordVisible = true;
  bool _isChecked = false;
  String? _name;
  String? _email;
  String? _dateOfBirth;
  String? _password;
  String? _address;
  String? _gender;

  /// BOTTOM NAV STATE
  int _selectedIndex = 0;

  /// FLOAT BUTTON STATE
  int _buttonFloatingIndex = 0;

  /// ADDRESS LIST
  List<String> _addresses = [
    '123 Main St, Cityville',
    '456 Oak Ave, Townsville',
    '789 Pine Rd, Villageburg'
  ];

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              // color: Colors.green,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text("Abhishek Mishra"),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text("A"),
                ),
              ),
            ),

            ListTile(
              title: Text('item 1'),
              leading: Icon(Icons.people),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('item 2'),
              leading: Icon(Icons.email),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu),
            )),
        title: Text('Example Test 2'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {},icon: Icon(Icons.info_outline)),
          IconButton(onPressed: () {},icon: Icon(Icons.more_vert))
        ],
      ),

      ///  BODY CHÍNH — CHUYỂN MÀN BẰNG IndexedStack
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          buildFormView(), // TAB 0
          buildGridview(),
          tabBarView(), // TAB 2
          buildProfileView(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _buttonFloatingIndex++;
          });
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,/// dùng để hiển thị nhiều hơn 3 tab
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Profile'),

        ],
      ),
    );
  }

  /// Grid View
  Widget buildGridview(){
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,/// số cột
            mainAxisSpacing: 4.0,/// khoảng cách dọc giữa các item
            crossAxisSpacing: 4.0,/// khoảng cách ngang giữa các item
        ),
        children: List.generate(20, (index) {
          return Card(
            color: Colors.blue,
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }),
    );
  }

  /// Tabbar view
  Widget tabBarView(){
      return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text("TabBar View"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home"),
                  Tab(icon: Icon(Icons.book), text: "Course"),
                  Tab(icon: Icon(Icons.contact_page), text: "Contact"),
                  Tab(icon: Icon(Icons.person), text: "Profile"),
                  Tab(icon: Icon(Icons.settings), text: "Settings"),
                ],
              ),
            ),

            body: TabBarView(
                children: [
                  Icon(Icons.music_note,size: 100,),
                  Icon(Icons.movie,size: 100,),
                  Icon(Icons.games,size: 100,),
                  Icon(Icons.shopping_cart,size: 100,),
                  Icon(Icons.flight,size: 100,),
                ]),
          )
      );
  }

  /// test widget
  Widget buildProfileView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            overflow: TextOverflow.clip,
            softWrap: true,
            textScaler: TextScaler.linear(1),
            maxLines: 1,
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style.copyWith(
                decoration: TextDecoration.none,
              ),
              children: const [
                TextSpan(
                  text: 'Geeks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Thêm ListView.builder 10 items
          SizedBox(
            height: 200, // bắt buộc phải có chiều cao khi nằm trong Column
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Item số ${index + 1}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  /// FORM VIEW — TAB 0
  Widget buildFormView() {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 16),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: "Nhập họ tên",
                  helperText: "Vui lòng nhập họ tên đầy đủ",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _fullNameController.clear()),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v == null || v.isEmpty ? "Không được trống" : null,
                onSaved: (v) => _name = v,
              ),

              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Nhập Email",
                  helperText: "Vui lòng nhập email",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _emailController.clear()),
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Vui lòng nhập email";
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v))
                    return "Email không hợp lệ";
                  return null;
                },
                onSaved: (v) => _email = v,
              ),

              SizedBox(height: 16),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(
                  labelText: "Nhập ngày sinh",
                  prefixIcon: Icon(Icons.calendar_today),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _dateOfBirthController.clear()),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));

                  if (picked != null) {
                    _dateOfBirthController.text =
                        DateFormat("dd/MM/yyyy").format(picked);
                  }
                },
                validator: (v) =>
                v == null || v.isEmpty ? "Vui lòng nhập ngày sinh" : null,
                onSaved: (v) => _dateOfBirth = v,
              ),

              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _passwordVisible,
                decoration: InputDecoration(
                  labelText: "Nhập mật khẩu",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () =>
                          setState(() => _passwordVisible = !_passwordVisible)),
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Nhập mật khẩu";
                  if (v.length < 6) return "Ít nhất 6 ký tự";
                  return null;
                },
                onSaved: (v) => _password = v,
              ),

              SizedBox(height: 16),
              DropdownButtonFormField(
                value: _address,
                decoration: InputDecoration(
                    hintText: "Chọn địa chỉ",
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder()),
                items: _addresses
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => _address = v),
              ),

              SizedBox(height: 16),
              RadioListTile(
                  title: Text("Nam"),
                  value: "Nam",
                  groupValue: _gender,
                  onChanged: (v) => setState(() => _gender = v)),
              RadioListTile(
                  title: Text("Nữ"),
                  value: "Nữ",
                  groupValue: _gender,
                  onChanged: (v) => setState(() => _gender = v)),

              CheckboxListTile(
                title: Text("Đồng ý điều khoản"),
                // để ô check lên trước
                controlAffinity: ListTileControlAffinity.leading,
                value: _isChecked,
                onChanged: (v) => setState(() => _isChecked = v!),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Count: $_buttonFloatingIndex",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Name: $_name\nDOB: $_dateOfBirth\nEmail: $_email\nAddress: $_address\nGender: $_gender\nĐiều khoản: ${_isChecked ? 'OK' : 'NO'}'\nPass: $_password")));
                        }
                      },
                      child: Text("Submit")),

                  SizedBox(width: 20),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        _formKey.currentState!.reset();
                        _fullNameController.clear();
                        _emailController.clear();
                        _dateOfBirthController.clear();
                        _passwordController.clear();

                        setState(() {
                          _address = null;
                          _gender = null;
                          _isChecked = false;
                          _buttonFloatingIndex = 0;
                          _name = null;
                        });
                      },
                      child: Text("Reset")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
