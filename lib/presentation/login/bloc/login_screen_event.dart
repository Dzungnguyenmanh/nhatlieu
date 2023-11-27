// ignore_for_file: must_be_immutable

part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent extends Equatable {}


class LoginScreenInitEvent extends LoginScreenEvent {
  @override
  List<Object> get props => [];
}

class CreateLoginEvent extends LoginScreenEvent {
  CreateLoginEvent({
    required this.onCreateLoginEventSuccess,
    required this.onCreateLoginEventError,
  });

  Function onCreateLoginEventSuccess;

  Function onCreateLoginEventError;

  @override
  List<Object?> get props => [
    onCreateLoginEventSuccess,
    onCreateLoginEventError,
  ];
}

///event for change password visibility
class ChangePasswordVisibilityEvent extends LoginScreenEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
    value,
  ];
}