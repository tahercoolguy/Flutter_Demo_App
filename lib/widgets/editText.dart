
import 'package:flutter/material.dart';

class editText extends StatelessWidget
{
  var controller = TextEditingController();
  String textdecoaration="";
  String textvalidation="";


  editText(this.controller, this.textdecoaration, this.textvalidation);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: textdecoaration),
        validator: (value) {
          if (value.isEmpty) {
            return textvalidation;
          }
          return null;
        },
      ),
    );
  }
}