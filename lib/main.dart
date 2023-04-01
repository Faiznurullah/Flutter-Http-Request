import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var response = await http.delete(
                Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
              );
              print(response.statusCode);
            },
            child: Text('Hapus Data'),
          ),
        ),
      ),
    );
  }
}
