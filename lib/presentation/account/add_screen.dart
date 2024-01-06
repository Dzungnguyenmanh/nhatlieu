import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/code_page.dart';
import 'package:nhatlieu/presentation/account/bloc/account_bloc.dart';
import 'package:nhatlieu/presentation/account/regisform.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AccountBloc(AccountState())..add(AddAccountEvent()),
        child: AddScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const CodePage(
      title: 'Đăng ký thành viên',
      child: Regisform(),
    );
  }
}
