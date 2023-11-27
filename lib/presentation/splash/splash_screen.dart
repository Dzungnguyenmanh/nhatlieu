// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';
import 'package:nhatlieu/cores/utils/imageView.dart';
import 'package:nhatlieu/cores/utils/imgs_utils.dart';
import 'package:nhatlieu/presentation/splash/bloc/splash_bloc.dart';
import 'package:nhatlieu/presentation/splash/models/splash_model.dart';

class SplashScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) => SplashBloc(SplashState(splashModel: SplashModel()))
          ..add(SplashInitEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: ColrUtils.bgprimary,
          body: Stack(
            children: <Widget>[
              Align(
                alignment: const Alignment(0.0, -0.10),
                child: HImageView(
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                  imagePath: ImgsUtils.logofile,
                ),
              ),
            ],
          ));
    });
  }
}
