import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';
import 'package:nhatlieu/cores/utils/imageView.dart';
import 'package:nhatlieu/cores/utils/imgs_utils.dart';
import 'package:nhatlieu/presentation/customer/addcustomer.dart';
import 'package:nhatlieu/presentation/started/bloc/started_screen_bloc.dart';
import 'package:nhatlieu/presentation/wigets/custom_textField.dart';
import 'package:get/get.dart';

import 'dart:ui';

class StartedScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider(
        create: (context) => StartedScreenBloc(StartedScreenState())
          ..add(StartedScreenInitEvent()),
        child: StartedScreen());
  }

  final TextEditingController _seachtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartedScreenBloc, StartedScreenState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: ColrUtils.primary,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(180), child: _appBar(context)),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Text(
                      'Danh sách khách hàng',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColrUtils.textprimary,
                          fontSize: 19),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      );
    });
  }

  Widget _appBar(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 10),
            height: 180,
            decoration: _boxDecoration(),
            child: Row(
              children: <Widget>[
                Align(
                    alignment: const Alignment(0.0, 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _searchBar(),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 150,
        left: 37,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(35)),
          width: 65,
          height: 65,
          child: InkWell(
            onTap: _addCustomer(context,const Addcustomer()),
            child: HImageView(
              imagePath: ImgsUtils.plushIcon,
              width: 10,
              height: 10,
            ),
          ),
        ),
      ),
      Positioned(
        top: 150,
        left: 170,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15)),
          width: 75,
          height: 75,
          child: HImageView(
            imagePath: ImgsUtils.userIcon,
            width: 35,
            height: 35,
          ),
        ),
      ),
      Positioned(
        top: 150,
        left: 320,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(35)),
          width: 65,
          height: 65,
          child: InkWell(
            onTap: _logdetails,
            child: const Icon(Icons.menu),
          ),
        ),
      ),
    ]);
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(211, 58, 47, 1),
          Color.fromRGBO(174, 46, 38, 1)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)));
  }

  Widget _searchBar() {
    return SizedBox(
      width: 300,
      child: CustomTextField(
        controller: _seachtext,
        width: 300,
        textInputType: TextInputType.text,
        prefix: const Icon(Icons.search),
        suffix: InkWell(
          onTap: _clearSearch,
          child: const Icon(Icons.close),
        ),
        fontStyle: TextFormFieldFontStyle.InterMediumStand,
      ),
    );
  }

   _addCustomer(BuildContext context, var val) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: ColrUtils.bgprimary,
            child: val,
          );
        });
  }

  void _clearSearch() {
    _seachtext.clear();
  }

  void _logdetails() {
    _seachtext.clear();
  }
}
