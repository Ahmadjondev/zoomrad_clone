import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant.dart';

class ChekMonitoring extends StatefulWidget {
  const ChekMonitoring({Key? key}) : super(key: key);

  @override
  State<ChekMonitoring> createState() => _ChekMonitoringState();
}

class _ChekMonitoringState extends State<ChekMonitoring> {
  String card = '';

  @override
  void initState() {
    super.initState();
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nomi",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Text(
                    "P2P ALOQAMOBILE 2",
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
                  "Karta raqami",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "986060******6841",
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
                  "-25 000 000",
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
                  "Sana",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "01.08.2022 11:25",
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
                  "Xizmat ko'rsatish ofisi",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "0060200000507CS",
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
                  "1978504N2",
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
                  "Manzil",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "",
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
                  "To'lov turi",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "Tovarlar va xizmatlar\n uchun to`lov",
                  textAlign: TextAlign.end,
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
                  "Tranzaksiya ID",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'mont_semibold'),
                ),
                Text(
                  "472519",
                  textAlign: TextAlign.end,
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
                  "Monitoringda\nkategoriya",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'mont_semibold'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    margin: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'mont_semibold'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: Colors.green,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.symmetric(vertical: 13,horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white,
                        ),
                        child: Image.asset("assets/ic_bottom_sheet_payment_by_requisites.png",
                            width: 14, height: 16, fit: BoxFit.fill),
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
