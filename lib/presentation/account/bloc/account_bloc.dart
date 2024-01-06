import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nhatlieu/cores/utils/app_route.dart';
import 'package:nhatlieu/cores/utils/navigator_utils.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(AccountState accountState) : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {});
    on<AddAccountEvent>(_addAccountEvent);
  }
  _addAccountEvent(AddAccountEvent event, Emitter<AccountState> emit) async {
    Future.delayed(const Duration(milliseconds: 3600), () {
      NavUtils.pushNameAndRemoveUtil(
        AppRoutes.addScreen,
      );
    });
  }
}
