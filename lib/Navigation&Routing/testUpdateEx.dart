import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exUpdateData extends StatefulWidget {
  const exUpdateData({super.key});

  @override
  State<exUpdateData> createState() => _exUpdateDataState();
}

class _exUpdateDataState extends State<exUpdateData> {
 final _keyform = GlobalKey<FormState>();
 TextEditingController _titleController = TextEditingController();

 String _title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child:ListView(
            children: [
              DrawerHeader(
                  child: Text('Drawer Header'),),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Handle the tap event
                },
              )
            ],
          ),
      ),
      appBar: AppBar(
        title: Text('Update Data Example'),
        backgroundColor: Colors.blue,

        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Add your refresh logic here
            },
          ),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.more_vert))
        ],
      ),

      body:
        Form(
          key: _keyform,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Current Title: $_title', style: TextStyle(fontSize: 20),),
                  SizedBox(height: 16,),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      label: Text('Title'),
                      hintText: 'Enter Title',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                          onPressed: (){
                              _titleController.clear();
                              /// set _title ='';

                          },
                          icon: Icon(Icons.clear)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 16,),

                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _title = _titleController.text;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white70),
                      child: Text('Update Data'))
                ],
              ),
            ),
          ),
        ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){

          }),

      bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          style: TabStyle.react,
          activeColor: Colors.white,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ]),
    );
  }
}
