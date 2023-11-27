// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';
import 'package:nhatlieu/presentation/login/bloc/login_screen_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailidController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            LoginScreenBloc(LoginScreenState())..add(LoginScreenInitEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColrUtils.primary,
              resizeToAvoidBottomInset: false,
              body: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: ColrUtils.primary,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ])));
    });
  }
}
