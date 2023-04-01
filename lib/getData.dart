import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void GetData() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var body = 'no data';
  void getData() async {
    var Myresponse = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/4'));

    Map<String, dynamic> data = jsonDecode(Myresponse.body);

    setState(() {
      body = data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(body),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
