import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamaUtama(),
    );
  }
}

class HalamaUtama extends StatefulWidget {
  const HalamaUtama({super.key});

  @override
  State<HalamaUtama> createState() => _HalamaUtamaState();
}

class _HalamaUtamaState extends State<HalamaUtama> {

Map user = {
  "name": "John Smith",
  "email": "john@example.com"
};

getdata() async{
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response = await http.get(url);
  var jsonobject = jsonDecode(response.body);
  return jsonobject;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(user['name']),
            FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("data");
                }else if(snapshot.hasData){
                  var data = snapshot.data as List;
                  return Text(data[0]['title'].toString());
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              },
              )

          ],
        ),
      ),
    );
  }
}