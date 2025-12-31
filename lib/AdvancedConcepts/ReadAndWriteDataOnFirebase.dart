import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fireBaseEx extends StatefulWidget {
  const fireBaseEx({super.key});

  @override
  State<fireBaseEx> createState() => _fireBaseExState();
}

class _fireBaseExState extends State<fireBaseEx> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text("Firebase Firestore Example"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          writeDataOnFirebase(),
          readDataOnFirebase()
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.green,
        activeColor: Colors.white,
        style: TabStyle.react,
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.upload, title: 'Write Data'),
          TabItem(icon: Icons.download, title: 'Read Data'),
        ],
      ),
    );
  }

  Widget writeDataOnFirebase() {
    return Center(
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance.collection('data')
          /// đây là bảng trong firebase
          .add({'text': 'data added through app 2'});

          ///dữ liệu được thêm vào,
          /// text ở đây là cột
        },
      ),
    );
  }

  Widget readDataOnFirebase() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text("Read Data from Firebase"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: Center(child: Text(document['text'])),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
