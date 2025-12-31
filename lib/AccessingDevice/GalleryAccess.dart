import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalerryAccess extends StatefulWidget {
  const GalerryAccess({super.key});

  @override
  State<GalerryAccess> createState() => _GalerryAccessState();
}

class _GalerryAccessState extends State<GalerryAccess> {
  int _selectedIndex = 0;

  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Access Example'),
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: galleryAccessTab()),
          Center(child: Text('Gallery Page')),
          Center(child: Text('Profile Page')),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        activeColor: Colors.white,
        style: TabStyle.react,
        initialActiveIndex: _selectedIndex,
        onTap: (int i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.photo, title: 'Gallery'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  Widget galleryAccessTab() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showPicker(context: context);
            },
            child: Text('Select Image from Gallery and Camera'),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            width: 200,
            child: galleryFile != null
                ? Image.file(galleryFile!)
                : Text('No image selected'),
          ),
        ],
      ),
    );
  }

  void _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(ImageSource img) async {
    // pick image from gallary
    final pickedFile = await picker.pickImage(source: img);
    // store it in a valid variable
    XFile? xfilePick = pickedFile;
    setState(() {
      if (xfilePick != null) {
        // store that in global variable galleryFile in the form of File
        galleryFile = File(pickedFile!.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          // is this context <<<
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }
}
