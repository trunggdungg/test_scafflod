import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExampleTest2 extends StatefulWidget {
  const ExampleTest2({super.key});

  @override
  State<StatefulWidget> createState() => _ExampleTest2State();
}

class _ExampleTest2State extends State<ExampleTest2> {
  final _dateOfBirthController = TextEditingController();
  bool _passwordVisible = true;
  bool _isChecked = false;
  String? _gender;
  List<String> _addresses = [
    '123 Main St, Cityville',
    '456 Oak Ave, Townsville',
    '789 Pine Rd, Villageburg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Test 2'),
        backgroundColor: Colors.blue,

        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Action for info button
            },
          ),
          IconButton(
              onPressed: (){
                // Action for settings button
              },
              icon: Icon(Icons.more_vert))
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
       child: Form(
           child: Column(
             children: [
               TextField(
                 decoration: InputDecoration(
                  label: Text("Nhập họ tên"),
                   helperText: ("Vui lòng nhập họ tên đầy đủ"),
                   // hintText: 'Nguyễn Văn A',
                   prefixIcon: Icon(Icons.person),
                   suffixIcon: IconButton(
                       onPressed: (){
                          // Action for suffix icon button
                       },
                       icon: Icon(Icons.clear)),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                 ),
               ),

                SizedBox(height: 16.0,),

               TextField(
                 decoration: InputDecoration(
                   label: Text('Nhập Email'),
                   helperText: 'Vui lòng nhập địa chỉ email',
                   prefixIcon: Icon(Icons.email),
                   suffixIcon: IconButton(
                       onPressed: (){

                       },
                       icon: Icon(Icons.clear)),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                 ),

                 keyboardType: TextInputType.emailAddress,
               ),
               SizedBox(height: 16.0,),
               TextFormField(
                 controller: _dateOfBirthController,
                 decoration: InputDecoration(
                   label: Text('Nhập ngày sinh'),
                   helperText: 'Vui lòng nhập ngày sinh',
                   prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))

                 ),
                 readOnly: true,
                 onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)
                    );

                    if(pickedDate != null){
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                  setState(() {
                    _dateOfBirthController.text = formattedDate;
                  });
                      // You can use setState to update the TextField with the selected date
                    }
                 },
               ),
               SizedBox(height: 16,),
               TextField(
                 decoration: InputDecoration(
                   label: Text('Nhập mật khẩu'),
                   helperText: 'Vui lòng nhập mật khẩu',
                   prefixIcon: Icon((Icons.lock)),
                   suffixIcon: IconButton(
                       onPressed: (){
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                       },
                       icon: Icon(
                           _passwordVisible ? Icons.visibility : Icons.visibility_off
                       )
                   ),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                 ),
               ),
              SizedBox(height: 16,),

               DropdownButtonFormField(
                 decoration: InputDecoration(
                   label: Text('Chọn địa chỉ'),
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                 ),
                   items: _addresses.map((add){
                     return DropdownMenuItem(
                       value: add,
                         child: Text(add)
                     );
                   }).toList(),
                   onChanged: (value){
                      // Action on address selection
                   }),
               SizedBox(height: 16,),

               Column(
                 children: [
                   RadioListTile(
                       title: Text("Nam"),
                       value: "Nam",
                       groupValue: _gender, onChanged: (value){
                         setState(() {
                           _gender = value.toString();
                         });
                   }),
                   RadioListTile(
                       title: Text("Nữ"),
                       value: "Nữ",
                       groupValue: _gender,
                       onChanged: (value){
                     setState(() {
                       _gender = value.toString();
                     });
                   }),
                 ],
               ),

               SizedBox(height: 16,),
               CheckboxListTile(
                 title: Text('Đồng ý với các điều khoản'),
                   controlAffinity: ListTileControlAffinity.leading,
                   value: _isChecked,
                   onChanged: (value){
                     setState(() {
                       _isChecked = value!;
                     });
                   }
               ),
               SizedBox(height: 16,),
               
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                       foregroundColor: Colors.white
                     ),
                       onPressed: (){
                         
                       }, 
                       child: Text('Submit')
                   ),
                    SizedBox(width: 20,),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                       foregroundColor: Colors.white
                     ),
                       onPressed: (){

                       },
                       child: Text('Reset')
                   ),
                 ],
               )
             ],
           ),
       ),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

          }),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
        ],
      ),
    );
  }
}
