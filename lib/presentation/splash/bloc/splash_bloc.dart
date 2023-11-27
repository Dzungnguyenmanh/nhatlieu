
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/app_route.dart';
import 'package:nhatlieu/cores/utils/navigator_utils.dart';
import 'package:nhatlieu/presentation/splash/models/splash_model.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initState) : super(initState) {
    on<SplashInitEvent>(_onInitialize);
  }

  _onInitialize(SplashInitEvent event, Emitter<SplashState> emit) async {
    Future.delayed(const Duration(milliseconds:  3600), () {
      NavUtils.pushNameAndRemoveUtil(
        AppRoutes.startedScreen,
      );
    });
  }
}
