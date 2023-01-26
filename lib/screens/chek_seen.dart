import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant.dart';
import '../model/chek.dart';

class ChekSeen extends StatefulWidget {
  ChekSeen(this.chek, {Key? key}) : super(key: key);
  Chek chek;

  @override
  State<ChekSeen> createState() => _ChekState();
}

class _ChekState extends State<ChekSeen> {
  late Chek chek;
  String card = '';

  @override
  void initState() {
    super.initState();
    chek = widget.chek;
    card += chek.to_card.substring(0, 4) + " ";
    card += chek.to_card.substring(4, 6) + "** **** ";
    card += chek.to_card.substring(12);
    print(card);
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
          "Chek",
          style:
              TextStyle(color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: active_color,
              ),
              child: Image.asset("assets/left-arrow.png",
                  width: 12, height: 16, fit: BoxFit.fill),
              // child: Icon(Icons.),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Oluvchi",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Text(
                    chek.name,
                    textAlign: TextAlign.end,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kartaga",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  card,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kartadan",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  chek.from_card,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Summa",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "${chek.amount} so'm",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vaqt",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  chek.time,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Мерчант",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  chek.merchant,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Terminal",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  chek.terminal,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Komissiya",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "0",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Holati",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "Amaliyot\nmuvaffaqiyatli\nbajarildi",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_bold'),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white,
                        ),
                        child: Image.asset("assets/ic_profile.png",
                            width: 16, height: 16, fit: BoxFit.fill),
                        // child: Icon(Icons.),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: const Text(
                          "Bo'lishish",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'mont_semibold'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 38,
          )
        ],
      ),
    );
  }
}
