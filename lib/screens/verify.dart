import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomrad/screens/loading.dart';
import 'package:zoomrad/screens/sms_verify.dart';
import 'package:zoomrad/screens/yakunlandi.dart';

import '../constant.dart';
import '../model/chek.dart';

class Verify extends StatefulWidget {
  Verify(this.chek, this.json, {Key? key}) : super(key: key);
  Chek chek;
  Map json;

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  String amount = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var future =
        await FirebaseDatabase.instance.reference().child("balance").get();
    amount = future.value.toString();
    print(amount);
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
            statusBarColor: back,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Icon(
                  CupertinoIcons.chevron_back,
                  color: Color(0xFF32A27C),
                ))),
        title: Text(
          "Kartadan kartaga pul o'tkazmasi",
          style:
              TextStyle(color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Qabul qiluvchi:",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Text(
                    widget.chek.name,
                    maxLines: 2,
                    textAlign: TextAlign.end,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'mont_bold'),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Qabul qiluvchi kartasi:",
                  style: TextStyle(
                      color: grey.withOpacity(01),
                      fontSize: 13,
                      fontFamily: 'mont_semibold'),
                ),
                Text(
                  widget.json['card'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "O'tkazma summasi:",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "${widget.json['amount']} so'm",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  children: [
                    Text("O'tkazmasi komissiyasi ",
                        style: TextStyle(
                            color: grey,
                            fontSize: 13,
                            fontFamily: 'mont_bold')),
                    Text("0%",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'mont_bold')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  children: [
                    Text("Jami summa ",
                        style: TextStyle(
                            color: grey,
                            fontSize: 13,
                            fontFamily: 'mont_bold')),
                    Text("${widget.json['amount']} so'm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'mont_bold')),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 5),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage("assets/ic_card_background_0.png"),
                      fit: BoxFit.cover,
                    )),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 12, top: 6),
                          child: Image.asset(
                            "assets/card_logo_humo.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Aloqabank Humo",
                            style: TextStyle(
                                fontFamily: 'mont_regular',
                                color: Colors.white,
                                fontSize: 11),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "9860 19** **** 5917",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'mont_regular',
                                  color: Colors.white),
                            ),
                            StreamBuilder(
                                stream: FirebaseDatabase.instance
                                    .reference()
                                    .child("balance")
                                    .get()
                                    .asStream(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    print(snapshot.data.value);
                                    return Text(
                                      "${Tools.numberConvert(snapshot.data.value.toString())} so'm",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'mont_semibold',
                                          color: Colors.white),
                                    );
                                  }
                                  return Text(
                                    "${Tools.numberConvert("2469700")} so'm",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'mont_semibold',
                                        color: Colors.white),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                FirebaseDatabase.instance
                    .reference()
                    .child("Monitoring")
                    .push()
                    .set(widget.chek.toJson());
                String replace = '';
                widget.chek.amount.split(' ').forEach((element) {
                  replace += element;
                });
                amount = "${(int.parse(amount) - int.parse(replace))}";
                FirebaseDatabase.instance
                    .reference()
                    .child('balance')
                    .set(amount);
                Navigator.push(
                context,
                    CupertinoPageRoute(
                      builder: (context) => Loading(() {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SmsVerify(widget.chek),
                            ));
                      }),
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
                    color: active_color,
                  ),
                  child: const Text(
                    "O'tkazish",
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
