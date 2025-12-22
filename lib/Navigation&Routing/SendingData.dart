import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class sendingData extends StatefulWidget {
  const sendingData({super.key});

  @override
  State<StatefulWidget> createState() => _sendingDataState();
}

class _sendingDataState extends State<sendingData> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sending Data Example'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: (_futureAlbum ==null)? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          SizedBox(height: 16,),

          ElevatedButton(
              onPressed: (){
                setState(() {
                  _futureAlbum = sendingDataApi(_controller.text);
                });
              },
              child: Text('Submit'))
        ],
      ):
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Text('Album Created Successfully! \n\n Title: ${snapshot.data!.title} \n\n Id: ${snapshot.data!.id}');
                  }else if(snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),

              ElevatedButton(///nút back về trang trước
                  onPressed: (){
                    setState(() {
                      _futureAlbum = null;
                    });
                  },
                  child: Text('Back'))
            ],),
          )

    );
  }
}

Future<Album> sendingDataApi(String title) async{
  final http.Response res = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if(res.statusCode ==201){
    return Album.fromJson(json.decode(res.body));
  }else {
    throw Exception('Failed to create album');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String , dynamic> json){
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}