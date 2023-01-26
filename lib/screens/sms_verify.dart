import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomrad/model/chek.dart';
import 'package:zoomrad/screens/loading.dart';
import 'package:zoomrad/screens/yakunlandi.dart';

import '../constant.dart';

class SmsVerify extends StatefulWidget {
  SmsVerify(this.chek,{Key? key}) : super(key: key);
  Chek chek;

  @override
  State<SmsVerify> createState() => _SmsVerifyState();
}

class _SmsVerifyState extends State<SmsVerify> {
  TextEditingController sms = TextEditingController();
  String code = '';
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () async{
      var kod = Random().nextInt(99999).toString();
      sms.text = kod;
      setState(() {
        code = kod;
      });
      await Future.delayed(Duration(milliseconds: 100));
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => Loading((){
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Yakunlandi(widget.chek),
                  ));
            }),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      appBar: AppBar(
        backgroundColor: back,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: back, statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
                padding: EdgeInsets.only(left: 2),
                child: Icon(
                  CupertinoIcons.chevron_back,
                  color: Color(0xFF32A27C),
                ))),
        title: Text(
          "Tasdiqlash",
          style:
              TextStyle(color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset(
              "assets/ic_zoomrad_registration.png",
              width: 100,
              height: 100,
            ),
          ),
          Text(
            "Tasdiqlash SMS-kodi quyidagi raqamga yuborildi",
            style: TextStyle(
              fontFamily: 'mont_semibold',
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "99890 *** ** 24",
              style: TextStyle(
                fontFamily: 'mont_semibold',
                fontSize: 14,
              ),
            ),
          ),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.white,
            ),
            child: TextField(
              controller: sms,
              style: const TextStyle(
                fontFamily: 'mont_semibold',
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              onChanged: (s) {
                setCardName(s);
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'SMS-kodni kiriting',
                hintStyle: TextStyle(
                  fontFamily: 'mont_semibold',
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                dynamic chek = widget.chek;
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Yakunlandi(chek),
                    ));
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:code.length > 0 ? active_color : grey,
                  ),
                  child: Text(
                    "Tasdiqlash",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'mont_bold',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
