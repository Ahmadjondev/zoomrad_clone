
import 'package:flutter/material.dart';
import 'package:zoomrad/constant.dart';

class Asosiy extends StatefulWidget {
  const Asosiy({Key? key}) : super(key: key);

  @override
  State<Asosiy> createState() => _AsosiyState();
}

class _AsosiyState extends State<Asosiy> {
  String amount = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Run().con;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Material(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  // width: size.width * 0.95,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img_autopayment_bg.png"))),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: grey,
                        blurRadius: 1,
                        spreadRadius: 0.1,
                        offset: Offset(0.0, 1.0))
                  ],
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/virtual_top_bg.png"))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16),
                    child: Text(
                      "Jami balans",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'mont_regular',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/ic_balance_hide.png",
                          width: 24, height: 24),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder(
                            stream: Run().con,
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                print(snapshot.data.value);
                                return Text(
                                  "${Tools.numberConvert(snapshot.data.value.toString())} so'm",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'mont_semibold',
                                  ),
                                );
                              }
                              return Text(
                                "    ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: 'mont_semibold',
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ic_go_to.png",
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Kartalarga o'tish",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'mont_medium'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child:
                  Image.asset("assets/ic_main_refresh_balance.png", height: 20),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/ic_main_operation_cashback.png")),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Keshbek",
                              style: TextStyle(
                                  fontFamily: 'mont_semibold', fontSize: 11),
                            ),
                            Text("48.0",
                                style: TextStyle(
                                    fontFamily: 'mont_semibold', fontSize: 14)),
                            Text("ballar",
                                style: TextStyle(
                                    fontFamily: 'mont_regular', fontSize: 11)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/ic_main_operation_moneybox.png")),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jamg'arma",
                              style: TextStyle(
                                  fontFamily: 'mont_semibold', fontSize: 11),
                            ),
                            Text("0",
                                style: TextStyle(
                                    fontFamily: 'mont_semibold', fontSize: 14)),
                            Text("so'm",
                                style: TextStyle(
                                    fontFamily: 'mont_regular', fontSize: 11)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/ic_main_operation_deposit.png")),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Omonatlar",
                              style: TextStyle(
                                  fontFamily: 'mont_semibold', fontSize: 11),
                            ),
                            Text("0",
                                style: TextStyle(
                                    fontFamily: 'mont_semibold', fontSize: 14)),
                            Text("so'm",
                                style: TextStyle(
                                    fontFamily: 'mont_regular', fontSize: 11)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/ic_main_operation_credit.png")),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kreditlar",
                              style: TextStyle(
                                  fontFamily: 'mont_semibold', fontSize: 11),
                            ),
                            Text("0",
                                style: TextStyle(
                                    fontFamily: 'mont_semibold', fontSize: 14)),
                            Text("so'm",
                                style: TextStyle(
                                    fontFamily: 'mont_regular', fontSize: 11)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: size.width,
          height: 110,
          margin: EdgeInsets.only(left: 16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 90,
                width: size.width * 0.7,
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/mycar_image.webp",
                        height: 44, width: 60),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "Mening avtomobilim",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'mont_semibold',
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 160),
                              child: Text(
                                "Jarima bepul va o'z vaqtida bilib boring",
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontFamily: 'mont_semibold',
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 90,
                width: size.width * 0.7,
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/humo_pay.jpg",
                        height: 44, width: 60),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "HUMOPay",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'mont_semibold',
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 160),
                              child: Text(
                                "Smartfon orqali kontraksiz \nto'lov",
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontFamily: 'mont_semibold',
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tezkor to'lovlar",
                style: TextStyle(
                    fontFamily: 'mont_semibold', fontSize: 10, color: grey),
              ),
              Text(
                "Barchasi",
                style: TextStyle(
                    fontFamily: 'mont_semibold', fontSize: 10, color: grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.add,
                  color: grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Valyuta kursi",
                style: TextStyle(
                    fontFamily: 'mont_semibold', fontSize: 10, color: grey),
              ),
              Text(
                "Barchasi",
                style: TextStyle(
                    fontFamily: 'mont_semibold', fontSize: 10, color: grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
