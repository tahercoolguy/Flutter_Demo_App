

import 'package:flutter/material.dart';
import 'package:myapp/DataModels/form.dart';

class formHeaderListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Name"),
        Text("Age"),
        Text("email"),
        Text("telephone"),

        Text("Image_Url"),
      ],);
  }
}