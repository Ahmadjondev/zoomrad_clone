import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant.dart';

class Loading extends StatefulWidget {
  Loading(
    this.call, {
    Key? key,
  }) : super(key: key);
  VoidCallback call;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 600), widget.call);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: Center(
        child:
            Lottie.asset("assets/lottie/loader.json", height: 150, width: 150),
      ),
    );
  }
}
