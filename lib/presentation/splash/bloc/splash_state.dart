// ignore_for_file: must_be_immutable

part of 'splash_bloc.dart';

class SplashState extends Equatable {
  
  SplashState({this.splashModel});
  
  SplashModel? splashModel;

  @override
  List<Object?> get props => [splashModel];

  SplashState copyWith({SplashModel? splashModel })
  {
    return SplashState(splashModel:splashModel ?? this.splashModel);
  }
}

