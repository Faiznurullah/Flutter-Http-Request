import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void FutureList() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  List data = [];
  Future getData() async {
    var Myresponse =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (Myresponse.statusCode == 200) {
      var dataResponse = jsonDecode(Myresponse.body) as List;
      setState(() {
        data = dataResponse;
      });
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(builder: (context, Snapshoot) {
        future:
        getData();
        if (Snapshoot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                final DataUser = data[index];
                return ListTile(
                  title: Text(
                    DataUser['name'],
                  ),
                );
              }));
        }
      }),
    );
  }
}
