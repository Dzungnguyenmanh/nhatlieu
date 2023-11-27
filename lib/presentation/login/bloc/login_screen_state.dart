// ignore_for_file: must_be_immutable

part of 'login_screen_bloc.dart';

class LoginScreenState extends Equatable {
  LoginScreenState(
      {this.loginModelObj,
      this.emailController,
      this.passwordController,
      this.isShowPass = true});

  TextEditingController? emailController;
  TextEditingController? passwordController;
  bool isShowPass;

  LoginModel? loginModelObj;

  @override
  List<Object?> get props =>
      [loginModelObj, emailController, passwordController, isShowPass];
  LoginScreenState copyWith(
      {LoginModel? loginModelObj,
      TextEditingController? emailController,
      TextEditingController? passwordController,
      bool? isShowPass}) {
    return LoginScreenState(
        loginModelObj: loginModelObj ?? this.loginModelObj,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
        isShowPass: isShowPass ?? this.isShowPass);
  }
}
