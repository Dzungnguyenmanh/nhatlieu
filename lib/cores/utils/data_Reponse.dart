import 'dart:convert';

import 'package:nhatlieu/presentation/home/models/account_model.dart';

class DataResponse {
  int? status;
  String? message;
  List<AccModel>? data;
  DataResponse({this.status, this.message, this.data});

  DataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? List<AccModel>.from(json["data"].map((x) => AccModel.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (this.data != null) {
      data['data'] = this.data?.toList();
    }
    return data;
  }
}
