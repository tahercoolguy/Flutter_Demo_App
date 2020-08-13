import 'package:flutter/material.dart';
import 'package:myapp/DataModels/form.dart';

import 'FormFilling.dart';

class FormViewWithDataTable extends StatefulWidget {
  List<form> forms;

  FormViewWithDataTable(this.forms);

  @override
  State createState() {
    return FormDataTable(this.forms);
  }
}

class FormDataTable extends State<FormViewWithDataTable> {
  List<form> forms;

  FormDataTable(this.forms);

  void _getSelectedRowInfo(dynamic name) {
    print('Name:$name');
  }
  void _awaitReturnValueFromSecondScreen(BuildContext context,form item) async {
    // start the SecondScreen and wait for it to finish with a result
     await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FormFilling(
                    forms: forms,
                    operation: "update",
                    selectedItem: item)));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      this.forms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Details"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: DataTable(
              onSelectAll: (b) {},
              sortAscending: true,
              columns: <DataColumn>[
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Age")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("phone")),
                DataColumn(label: Text("Image URL")),
              ],
              rows: forms
                  .map((item) => DataRow(
                          cells: [
                            DataCell(
                              Text(item.Name),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                            DataCell(
                              Text(item.Age),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                            DataCell(
                              Text(item.email),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                            DataCell(
                              Text(item.telephone),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                            DataCell(
                              Text(item.Image_Url),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                          ],
                          onSelectChanged: (bool selected) {
                            if (selected) {
                              _awaitReturnValueFromSecondScreen(context,item);
                              print(item);
                            }
                          },
                          selected: false))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
