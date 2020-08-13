import 'package:flutter/material.dart';
import 'package:myapp/DataModels/employeesDM.dart';
import 'package:myapp/REST/services.dart';

class Api_Implementation extends StatefulWidget {
  @override
  State createState() {
    return ApiState();
  }
}


class ApiState extends State<Api_Implementation> {
List<Widget> lists=[];

  @override
  Widget build(BuildContext context) {
    lists.add(Center(
      child: RaisedButton(
        child: Text("Kindly Click Here"),
        onPressed: (){
          FutureBuilder(
            future: ApiService.getEmployees1(),
            builder: (context, snapshot) {
              final employeesDM employees = snapshot.data;
//          print(employees['data'][0]);
              print("Hello world");
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                      color: Colors.black,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Name: ${employees.data.elementAt(index).employeeName}"),
                      subtitle: Text('Age: ${employees.data.elementAt(index).employeeAge}'),
                    );
                  },
                  itemCount: employees.data.length,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter REST API'),
      ),
      body: Column(
        children: lists,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => AddNewEmployeePage(),
//            ),
//          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
