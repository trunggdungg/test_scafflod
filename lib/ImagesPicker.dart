import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagespicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return  _ImagespickerState();
  }
}

class _ImagespickerState extends State<Imagespicker>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 200),
       child: Center(
         child: FormField<File>(
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
       ),
     ),
   );
  }

}