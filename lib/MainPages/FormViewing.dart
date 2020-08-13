import 'package:flutter/material.dart';
import 'package:myapp/DataModels/form.dart';
import 'package:myapp/ListViewHeaders/formHeaderListView.dart';
import 'package:myapp/ListViewItems/formListViewItem.dart';

class FormViewing extends StatelessWidget {
  List<form> forms;

  FormViewing(this.forms);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Builder(
            builder: (context) {
              print(this.forms);
              return ListView.builder(
                  itemCount: this.forms.length,
                  itemBuilder: (context, position) {
                    return Column(children: <Widget>[
                      formHeaderListView(),
                      formListViewItem(this.forms.elementAt(position))
                    ]);
                  });
            },
          ),
        ));
  }
}
