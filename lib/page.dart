// Custom widget that has the text and button
import 'package:flutter/material.dart';
import 'package:myequifax/main.dart';

class NewPage extends StatefulWidget {
  @override
  NewPageState createState() => NewPageState();
}

class NewPageState extends State<NewPage> {
  String labelText = 'Testing demo';

  void changeText() {
    setState(() {
      labelText = 'New text assertion';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              labelText,
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            key: Key("button"),
            onPressed: changeText,
            child: Text('Change Text'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            key: Key("backButton"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
