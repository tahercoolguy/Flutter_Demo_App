import 'DataDM.dart';

class employeesDM {
  String status;
  List<DataDM> data;

  employeesDM({this.status, this.data});

  employeesDM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<DataDM>();
      json['data'].forEach((v) {
        data.add(new DataDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
