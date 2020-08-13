import 'package:flutter/material.dart';

class button extends StatelessWidget
{
  Function submit;
  String btnText;


  button(this.submit, this.btnText);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        child: Text(btnText),
        onPressed:submit ,
      ),

    );
  }
}