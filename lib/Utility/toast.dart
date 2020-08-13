import 'package:flutter/material.dart';

toast(String value, BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(value),
  ));
}
