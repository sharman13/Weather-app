import 'package:flutter/material.dart';
import 'Weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _textController = new TextEditingController();
  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter city name"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
          decoration: InputDecoration(
              labelText: "Enter City name",
            ),
          controller: _textController,
          ),
          RaisedButton(
            child: Text("Check the weather"),
            onPressed: (){
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => nextScreen(city: _textController.text),
                );
                Navigator.of(context).push(route);
            },
          ),
          ],
        ),
      ),
    );
  }
}