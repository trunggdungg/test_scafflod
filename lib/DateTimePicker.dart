import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//

class Datetimepicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _DatetimepickerState();
  }
}

class _DatetimepickerState extends State<Datetimepicker>{
  @override
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  String? _date;
  bool _acceptTerms = false;
  String? _opt;
  final List<String> _options = ["Option 1", "Option 2", "Option 3"];
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Date Time Picker"),

          actions: [
            TextButton.icon(
              onPressed: (){

              },
              label: Icon(Icons.search),
            ),
            TextButton.icon(
                onPressed: (){

                },
                label: Icon(Icons.more_vert),
            ),

          ],
        ),


     floatingActionButton: FloatingActionButton(
         onPressed: (){

         },
       child: Icon(Icons.add),
     ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(

                  labelText: "Enter Date",
                  prefixIcon: Icon(Icons.date_range),
                  hintText: "DD/MM/YYYY",
                  helperText: "Select your date of birth",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null ){
                    String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                    setState(() {
                      _dateController.text = formattedDate;

                    });
                  }else{
                    print("Date is not selected");
                  }
                },
                onSaved: (value){
                  _date = value;
                },

                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter date";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              //dropdown
              DropdownButtonFormField(
                decoration: InputDecoration(
                  label: Text("Select an option"),
                  hintText: "Choose one",
                  prefixIcon: Icon(Icons.list),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),

                ), items: _options.map((op){
                  return DropdownMenuItem(
                      value: op,
                      child: Text(op),
                  );
              }).toList(),
                onChanged: (value) {

                },
                onSaved: (value){
                  _opt = value;
                },

                validator: (value){
                  if(value == null){
                    return "Please select an option";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              //checkbox
              CheckboxListTile(
                title: Text("I accept the terms and conditions"),
                  value: _acceptTerms,
                  onChanged: (value){
                    setState(() {
                      _acceptTerms = !_acceptTerms;
                    });

                  }),
              SizedBox(height: 20.0),
              //nut
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Processing Data: $_date, $_opt"))
                        );
                      }
                    },
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),

                  SizedBox(width: 20.0),
                  ElevatedButton(
                      onPressed: (){
                        _formKey.currentState!.reset();
                        _dateController.clear();
                      },
                      child: Text("Reset"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      )
                  ),
                ],
              )
            ],
          ),
        )

      ),

     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.blue,
         selectedItemColor: Colors.white,
         items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"
            ),
         ]),
   );
  }
}