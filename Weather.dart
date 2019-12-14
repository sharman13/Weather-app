import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class nextScreen extends StatefulWidget {
  final String city;

  nextScreen({Key key, this.city}) : super(key: key);

  @override
  _nextScreenState createState() => _nextScreenState();
}

class _nextScreenState extends State<nextScreen> {

  bool isLoading = true;

  List weather;
  int temp;
  Future getData() async{
    String url = "http://api.openweathermap.org/data/2.5/weather?q=${widget.city}" + "&APPID=a1005ab84ea125f3c7fe70739f35d1df";
    print(url);
    var response = await http.get(
      Uri.encodeFull(url),
    );
    List data = jsonDecode(response.body)['weather'];
    print(data);
    setState(() {
     weather = data;
     isLoading = false; 
    });
  }
  //http://api.openweathermap.org/data/2.5/weather?q${widget.city}" + "&APPID=a1005ab84ea125f3c7fe70739f35d1df
  
  @override
  void initState(){
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather of ${widget.city}"),
      ),
      body: Center(
        child: isLoading ? CircularProgressIndicator() : Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 150.0),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30.0),
              ),
              Image(
                image: AssetImage("assets/clouds.png"),
                width: 150,
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
              ),
              Text(weather[0]['main'], style: TextStyle(fontSize: 40.0, color: Colors.red),)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
        ],)
      ),
    );
  }
}