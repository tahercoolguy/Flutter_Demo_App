import 'package:flutter/material.dart';
import 'package:myapp/DataModels/form.dart';

class formListViewItem extends StatelessWidget {
  form item;

  formListViewItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      Text(item.Name),
      Text(item.Age),
      Text(item.email),
      Text(item.telephone),
      Text(item.Image_Url),
    ],);
  }
}