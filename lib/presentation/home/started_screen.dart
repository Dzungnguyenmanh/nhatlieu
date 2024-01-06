// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/app_route.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';
import 'package:nhatlieu/cores/utils/imageView.dart';
import 'package:nhatlieu/cores/utils/imgs_utils.dart';
import 'package:nhatlieu/cores/utils/navigator_utils.dart';
import 'package:nhatlieu/cores/utils/text_utils.dart';
import 'package:nhatlieu/presentation/home/bloc/started_screen_bloc.dart';
import 'package:nhatlieu/presentation/wigets/custom_textField.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            HomeScreenBloc(const HomeState())..add(HomeInitEvent()),
        child: HomeScreen());
  }

  final TextEditingController _seachtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: ColrUtils.primary,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(180), child: _appBar(context)),
        body: SafeArea(
            child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 20,
              floating: false,
              backgroundColor: Colors.white,
              pinned: true,
              flexibleSpace: Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Text(
                  'Danh sách khách hàng',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColrUtils.textprimary,
                      fontSize: 18),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    // Define the shape of the card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // Define how the card's content should be clipped
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // Define the child widget of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Add padding around the row widget
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Add an image widget to display an image
                                HImageView(
                                  imagePath: ImgsUtils.avatar,
                                  height: 80,
                                  width: 55,
                                  radius: BorderRadius.circular(15),
                                  fit: BoxFit.contain,
                                ),

                                // Add some spacing between the image and the text
                                const SizedBox(width: 20),
                                // Add an expanded widget to take up the remaining horizontal space
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Add some spacing between the top of the card and the title
                                      Container(height: 10),
                                      // Add a title widget
                                      Text(
                                        state.accounts[index].userName
                                            .toString(),
                                        style: TextUtils.cardTitle,
                                      ),
                                      // Add some spacing between the title and the subtitle
                                      Container(height: 5),
                                      // Add a subtitle widget
                                      Text(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        "Ngày sinh:" +
                                            state.accounts[index].userBirthDay
                                                .toString(),
                                        style: TextUtils.cardSubTitle,
                                      ),
                                      Text(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        "Tuổi:" +
                                            state.accounts[index].age
                                                .toString(),
                                        style: TextUtils.cardSubTitle,
                                      ),
                                      Text(
                                        "Số buổi:" +
                                            state.accounts[index].couter
                                                .toString(),
                                        style: TextUtils.cardSubTitle,
                                      ),
                                      SizedBox(
                                          child: Row(children: <Widget>[
                                        Text(
                                          "Ngày bắt đầu:" +
                                              state.accounts[index].userHireDay
                                                  .toString(),
                                          style: TextUtils.cardSubTitle,
                                        ),
                                      ])),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        child: Row(children: <Widget>[
                                      OutlinedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          35))),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors.blue
                                                    .withOpacity(0.04);
                                              }
                                              if (states.contains(
                                                      MaterialState.focused) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return Colors.blue
                                                    .withOpacity(0.12);
                                              }
                                              return null; // Defer to the widget's default.
                                            },
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: HImageView(
                                          imagePath: ImgsUtils.history,
                                          height: 16,
                                          width: 16,
                                          radius: BorderRadius.circular(15),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      OutlinedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 2,
                                                    color: ColrUtils.bgTop),
                                                borderRadius:
                                                    BorderRadius.circular(35)),
                                          ),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors.blue
                                                    .withOpacity(0.04);
                                              }
                                              if (states.contains(
                                                      MaterialState.focused) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return Colors.blue
                                                    .withOpacity(0.12);
                                              }
                                              return null; // Defer to the widget's default.
                                            },
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: HImageView(
                                          imagePath: ImgsUtils.plushIcon,
                                          height: 18,
                                          width: 18,
                                          radius: BorderRadius.circular(15),
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    ])),
                                  ])
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                childCount: state.accounts.length, // Number of list items
              ),
            ),
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
            child: HImageView(
              imagePath: ImgsUtils.nuse,
              width: 10,
              height: 10,
            ),
            onTap: () {
              _addItem(context);
            },
          ),
        ),
      ),
      Positioned(
        top: 130,
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
            )),
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

  void _clearSearch() {
    _seachtext.clear();
  }

  void _logdetails() {
    _seachtext.clear();
  }

  _addItem(BuildContext context) {
    NavUtils.popAndPushNamed(AppRoutes.addScreen, args: {NavArgs.id: "id"});
  }
}
