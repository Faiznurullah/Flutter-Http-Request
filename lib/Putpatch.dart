import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

void Putpatch() {
  runApp(MyWidget());
}

// Put Dan Patch Sama Ajah Tinggal Ganti Method

class MyWidget extends StatelessWidget {
  void PostData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';

    var response = await http.put(Uri.parse(url), body: {
      'user_id': Random().nextInt(10).toString(),
      'title': inputtitle.text,
      'body': inputbody.text
    });

    print(response.body);
  }

  var inputtitle = TextEditingController();
  var inputbody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              TextField(
                controller: inputtitle,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: inputbody,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: PostData,
                child: Text('Edit Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
