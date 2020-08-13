import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/drawer_main.dart';

import 'DataModels/form.dart';

//class MyHttpOverrides extends HttpOverrides{
//  @override
//  HttpClient createHttpClient(SecurityContext context){
//    return super.createHttpClient(context)
//      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//  }
//}
//
void main() {
//  HttpOverrides.global = new MyHttpOverrides();
  runApp(new MyApp());

}

class MyApp extends StatelessWidget {

  final appTitle = 'Form Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  List<form> forms=[];
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Welcome Page!')),
      drawer: drawer_main(forms),
    );
  }
}
