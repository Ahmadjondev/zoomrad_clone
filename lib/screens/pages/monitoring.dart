import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoomrad/constant.dart';
import 'package:zoomrad/model/chek.dart';

import '../chek_monitoring.dart';

class Monitoring extends StatefulWidget {
  const Monitoring({Key? key}) : super(key: key);

  @override
  State<Monitoring> createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  var data;
  List<Chek> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    data = FirebaseDatabase.instance
        .reference()
        .child("Monitoring")
        .get()
        .asStream();
    var dat =
        await FirebaseDatabase.instance.reference().child("Monitoring").get();
    // print(data.value);
    (dat.value as Map).forEach((key, value) {
      list.add(Chek.fromJson(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                      ),
                      child: RotationTransition(
                        turns: new AlwaysStoppedAnimation(-90 / 360),
                        child: Image.asset("assets/left-arrow.png",
                            color: grey,
                            scale: 40,
                            width: 16,
                            height: 16,
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          const Text(
                            "61 568 420",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontFamily: 'mont_bold'),
                          ),
                          Text(
                            "Tushumlar",
                            style: TextStyle(
                                color: grey,
                                fontSize: 10,
                                fontFamily: 'mont_semibold'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                      ),
                      child: RotationTransition(
                        turns: new AlwaysStoppedAnimation(90 / 360),
                        child: Image.asset("assets/left-arrow.png",
                            color: grey,
                            scale: 40,
                            width: 16,
                            height: 16,
                            fit: BoxFit.fill),
                      ),
                      // child: Icon(Icons.),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          const Text(
                            "33 144 000",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontFamily: 'mont_bold'),
                          ),
                          Text(
                            "Chiqimlar",
                            style: TextStyle(
                                color: grey,
                                fontSize: 10,
                                fontFamily: 'mont_semibold'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "02.08.2022",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'mont_medium',
                ),
              ),
              Row(
                children: [
                  Text(
                    "+ 14 000 000",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'mont_bold',
                        color: Colors.green),
                  ),
                  Text(
                    " / ",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'mont_bold',
                        color: Colors.grey),
                  ),
                  Text(
                    "- 3 400 000",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'mont_bold',
                        color: Colors.red.shade900
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        StreamBuilder(
          stream: data,
          builder: (context, snapshot) {
            if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(
                child:  Lottie.asset("assets/lottie/loader.json", height: 150, width: 150),
              );
            }
            if(snapshot.hasData){
              return Expanded(
                child: RefreshIndicator(
                  color: Colors.green,
                  onRefresh: () async{
                    await Future.delayed(Duration(seconds: 1));
                  },
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // 02.08.2022
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "22:07",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 30 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5960",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "16:54",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 670 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5960",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "13:14",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 2 700 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5960",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(-90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "O'tkazmani otkazish",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "11:48",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "+ 14 000 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5917",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      // 01.08.2022
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01.08.2020",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'mont_medium',
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "+ 47 568 420",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'mont_bold',
                                      color: Colors.green),
                                ),
                                Text(
                                  " / ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'mont_bold',
                                      color: Colors.grey),
                                ),
                                Text(
                                  "- 29 744 000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'mont_bold',
                                      color: Colors.red.shade900
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "15:42",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 4 744 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5917",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ChekMonitoring(),));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white,
                                ),
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(90 / 360),
                                  child: Image.asset("assets/left-arrow.png",
                                      color: grey, width: 40, height: 40, fit: BoxFit.fill),
                                ),
                                // child: Icon(Icons.),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Tovarlar va xizmatlar uchun to'lov",
                                                style: TextStyle(
                                                    fontFamily: 'mont_semibold',
                                                    fontSize: 9,
                                                    color: grey),
                                              ),
                                              Text(
                                                "P2P ALOQAMOBILE 2",
                                                style: TextStyle(
                                                    fontFamily: 'mont_bold',
                                                    fontSize: 11,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "11:25",
                                                style: TextStyle(
                                                    fontFamily: 'mont_semibold',
                                                    fontSize: 9,
                                                    color: grey),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "- 25 000 000",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontFamily: 'mont_semibold'),
                                        ),
                                        Text(
                                          "986060******5917",
                                          style: TextStyle(
                                              fontFamily: 'mont_bold',
                                              fontSize: 9,
                                              color: grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(-90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "O'tkazmani otkazish",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "08:46",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "+ 47 568 420",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5917",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      // 31.07.2022
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "31.07.2020",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'mont_medium',
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "+ 8 300 000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'mont_bold',
                                      color: Colors.green),
                                ),
                                Text(
                                  " / ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'mont_bold',
                                      color: Colors.grey),
                                ),
                                Text(
                                  "- 6 000 000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'mont_bold',
                                      color: Colors.red.shade900
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "19:13",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 400 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5960",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "15:42",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 600 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5960",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tovarlar va xizmatlar uchun to'lov",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "10:31",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "- 5 000 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5960",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(-90 / 360),
                                child: Image.asset("assets/left-arrow.png",
                                    color: grey, width: 40, height: 40, fit: BoxFit.fill),
                              ),
                              // child: Icon(Icons.),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "O'tkazmani otkazish",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            ),
                                            Text(
                                              "P2P ALOQAMOBILE 2",
                                              style: TextStyle(
                                                  fontFamily: 'mont_bold',
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "09:27",
                                              style: TextStyle(
                                                  fontFamily: 'mont_semibold',
                                                  fontSize: 9,
                                                  color: grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "+ 8 300 000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontFamily: 'mont_semibold'),
                                      ),
                                      Text(
                                        "986060******5917",
                                        style: TextStyle(
                                            fontFamily: 'mont_bold',
                                            fontSize: 9,
                                            color: grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: grey.withOpacity(0.6),
                      ),



                    ],
                  ),
                ),
              );
            }
            return Container();

          }
        ),
        // StreamBuilder(
        //     stream: data,
        //     builder: (context, snapshot) {
        //       // List list = [];
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Container();
        //       }
        //       list.sort(
        //         (a, b) {
        //           return a.time.compareTo(b.time);
        //         },
        //       );
        //       if (snapshot.hasData) {
        //         return
        //       }
        //       return Container();
        //     })
      ],
    );
  }
}
