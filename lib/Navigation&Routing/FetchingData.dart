import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fetchData extends StatefulWidget {
  const fetchData({super.key});

  @override
  State<StatefulWidget> createState() => _fetchDataState();
}

class _fetchDataState extends State<fetchData> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetching Data Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
      child: FutureBuilder(
          future: futureAlbum,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Text('Album Title: ${snapshot.data!.title}');
            }else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          }),
      ),
    );
  }
}

Future<Album> fetchAlbum() async{
  final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if(res.statusCode ==200){
    return Album.fromJson(json.decode(res.body));
  }else{
    throw Exception('Failed to load album');
  }
}

class Album{
  final int userId;
  final int id;
  final String title;

  Album({required this.userId,required this.id,required this.title});

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
