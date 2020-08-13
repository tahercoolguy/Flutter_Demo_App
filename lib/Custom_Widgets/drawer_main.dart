import 'package:flutter/material.dart';
import 'package:myapp/DataModels/form.dart';
import 'package:myapp/MainPages/Api_Implementation.dart';
import 'package:myapp/MainPages/FormFilling.dart';
import 'package:myapp/MainPages/FormViewWithDataTable.dart';
import 'package:myapp/MainPages/FormViewing.dart';

class drawer_main extends StatelessWidget {
  List<form> forms = [];

  drawer_main(this.forms);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Welcome Taher'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Form Filling'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormFilling(forms: forms,operation: "insert",selectedItem: null)));
            },
          ),
          ListTile(
            title: Text('View Full Form List'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormViewing(forms)));
            },
          ),
          ListTile(
            title: Text("Data Table"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormViewWithDataTable(forms)));
            },
          ),
          ListTile(
            title: Text("Api Data"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Api_Implementation()));
            },
          ),
          ListTile(
            title: Text("Edit Form"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
