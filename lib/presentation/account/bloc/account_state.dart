part of 'account_bloc.dart';

class AccountState extends Equatable {
  AccountState(
      {this.ctlFullName,
      this.ctlage,
      this.ctlbirthday,
      this.ctlpackageId,
      this.ctlpackageName});

  TextEditingController? ctlFullName;
  TextEditingController? ctlage;
  TextEditingController? ctlbirthday;
  TextEditingController? ctlpackageId;
  TextEditingController? ctlpackageName;

  @override
  List<Object?> get props =>
      [ctlFullName, ctlage, ctlbirthday, ctlpackageId, ctlpackageName];
}

final class AccountInitial extends AccountState {}
