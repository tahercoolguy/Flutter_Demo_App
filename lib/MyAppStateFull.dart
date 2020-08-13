import 'package:flutter/material.dart';

class MyAppStateFull extends StatefulWidget {
  List<String> fruits;

  MyAppStateFull(this.fruits);

  @override
  State createState() {
    return MyAppState(this.fruits);
  }
}

class MyAppState extends State<MyAppStateFull> {
  List<String> fruits;
  MyAppState(this.fruits);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 20,
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Enter"),
              onPressed: buttonpressed,
            ),
            Column(
              children: fruits.map((element) => Text(element)).toList(),
            )
          ],
        ),
      ),
    );
  }

  void buttonpressed() {
    setState(() {
      fruits.add("Mango Added");
    });
  }
}