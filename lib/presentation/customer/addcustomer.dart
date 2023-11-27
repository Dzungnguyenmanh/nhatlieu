import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';

class Addcustomer extends StatefulWidget {
  const Addcustomer({Key? key}) : super(key: key);

  @override
  _AddcustomerState createState() => _AddcustomerState();
}

class _AddcustomerState extends State<Addcustomer> {
  double _dialogheight = 0.0;
  final double _dialogwidth = Get.width;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogheight = Get.height / 1.5;
      });
    });
  }

  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 600),
      curve: Curves.easeInOut,
      height: _dialogheight,
      width: _dialogwidth,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: Get.width,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColrUtils.bgTop,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Text('Thêm mới khách hàng',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColrUtils.textprimary)),
          )
        ]),
      ),
    );
  }
}
