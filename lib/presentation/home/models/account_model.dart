import 'dart:convert';

import 'package:equatable/equatable.dart';

List<AccModel> accModelFromJson(String str) =>
    List<AccModel>.from(json.decode(str).map((x) => AccModel.fromJson(x)));

String accModelToJson(List<AccModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

final class AccModel extends Equatable {
  const AccModel(
      {required this.userEnrollNumber,
      required this.userName,
      required this.userPhoneNumber,
      required this.userAddress,
      required this.userCardNo,
      required this.userSex,
      required this.userHireDay,
      required this.userBirthDay,
      required this.couter,
      required this.age,
      required this.packageName,
      required this.packageId});

  final int userEnrollNumber;
  final String userName;
  final String userAddress;
  final int age;
  final String userPhoneNumber;
  final String userCardNo;
  final int couter;
  final int packageId;
  final int userSex;
  final String userHireDay;
  final String userBirthDay;
  final String packageName;

  factory AccModel.fromJson(Map<String, dynamic> json) => AccModel(
      userEnrollNumber: json["userEnrollNumber"],
      userName: json["userFullName"] ?? "a",
      couter: json["packageCouter"] ?? 10,
      age: json["age"] ?? 10,
      packageId: json["packageId"] ?? 0,
      packageName: json["packageName"] != null
          ? json["packageName"].toString()
          : "Cơ bản",
      userAddress: json["userAddress"] ?? "",
      userPhoneNumber: json["userPhoneNumber"] != null
          ? json["userPhoneNumber"].toString()
          : "",
      userHireDay: json["userHireDay"] ?? "",
      userSex: json["userSex"],
      userBirthDay:
          json["userBirthDay"] != null ? json["userBirthDay"].toString() : "",
      userCardNo:
          json["userCardNo"] != null ? json["userCardNo"].toString() : "");

  Map<String, dynamic> toJson() => {
        "userEnrollNumber": userEnrollNumber,
        "username": userName,
        "userAddress": userAddress,
        "couter": couter,
        "userPhoneNumber": userPhoneNumber,
        "userHireDay": userHireDay,
        "userSex": userSex,
        "userCardNo": userCardNo,
        "userBirthDay": userBirthDay
      };

  @override
  List<Object?> get props => [
        userEnrollNumber,
        userName,
        userAddress,
        userPhoneNumber,
        couter,
        age,
        packageId,
        packageName,
        userCardNo,
        userSex,
      ];
}
