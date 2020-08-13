import 'package:flutter/material.dart';
import 'package:myapp/DataModels/form.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/editText.dart';

class FormFilling extends StatefulWidget {
  List<form> forms;
  String operation;
  form selectedItem;
  bool ins = true;
  bool up = true;

  bool del = true;

  FormFilling({this.forms, @required String this.operation, this.selectedItem});

  @override
  State createState() {
    return FormState1(forms);
  }
}

class FormState1 extends State<FormFilling> {
  List<form> forms;

  FormState1(this.forms);

  final name = TextEditingController();
  final Age = TextEditingController();
  final email = TextEditingController();
  final image_URL = TextEditingController();
  final phone = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  BuildContext thisWidgetContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Builder(builder: (context) {
            thisWidgetContext = context;
            if (widget.operation == "insert") {
              widget.up = false;
              widget.del = false;
            } else {
              widget.ins = false;
              name.text = widget.selectedItem.Name;
              Age.text = widget.selectedItem.Age;
              email.text = widget.selectedItem.email;
              phone.text = widget.selectedItem.telephone;
              image_URL.text = widget.selectedItem.Image_Url;
            }

            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    editText(name, "Name", "Please enter"),
                    editText(email, "Email", "Please enter"),
                    editText(Age, "Age", "Please enter"),
                    editText(phone, "phone", "Please enter"),
                    editText(image_URL, "Image URL", "Please enter"),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Visibility(
                                visible: widget.ins,
                                child: button(submit, "Submit")),
                            Visibility(
                                visible: widget.up,
                                child: button(update, "Update")),
                            Visibility(
                                visible: widget.del,
                                child: button(delete, "Delete"))
                          ]),
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }

  delete() {
    forms.remove(widget.selectedItem);
    Navigator.pop(context, "Just Any thing");
  }

  update() {
    if (_formKey.currentState.validate()) {
      forms[forms.indexOf(widget.selectedItem)] =
          form(name.text, Age.text, email.text, phone.text, image_URL.text);
      Scaffold.of(thisWidgetContext)
          .showSnackBar(SnackBar(content: Text('Updated Successfully')));
      Navigator.pop(context, "Just Any thing");
    }
  }

  submit() {
    {
      if (_formKey.currentState.validate()) {
        this.forms.add(
            form(name.text, Age.text, email.text, phone.text, image_URL.text));
        // If the form is valid, display a Snackbar.
        Scaffold.of(thisWidgetContext)
            .showSnackBar(SnackBar(content: Text('Inserted Successfully')));
        this.dispose();
      } else {
        Scaffold.of(thisWidgetContext)
            .showSnackBar(SnackBar(content: Text('Sorry')));
      }
    }
  }
}
