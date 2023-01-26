import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:zoomrad/screens/verify.dart';

import '../../constant.dart';
import '../../model/chek.dart';

class Otkazma extends StatefulWidget {
  const Otkazma({Key? key}) : super(key: key);

  @override
  State<Otkazma> createState() => _OtkazmaState();
}

class _OtkazmaState extends State<Otkazma> {
  TextEditingController card = TextEditingController();
  String cardName = '';
  TextEditingController amount = TextEditingController();

  String summa = '';
  bool oluvchi = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cardName = await getCardName();
    await Run().con;
  }

  double width = 600;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // width = size.width * 0.9;
    return Column(
      children: [
        const SizedBox(
          height: 40,
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
            controller: card,
            style: const TextStyle(
              fontFamily: 'mont_semibold',
              color: Colors.black,
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CardNumberFormatter(),
            ],
            maxLength: 19,
            onChanged: (s) async {
              if (s.length == 19) {
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  oluvchi = true;
                });
              } else {
                setState(() {
                  oluvchi = false;
                });
              }
            },
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 22, top: 11, bottom: 11),
                child: Image.asset(
                  "assets/ic_card_scanner.png",
                ),
              ),
              counterText: '',
              border: InputBorder.none,
              hintText: 'Qabul qiluvchi karta raqami',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          child: Container(
            height: 25,
            alignment: Alignment.topLeft,
            child: Text(
              oluvchi ? cardName : "",
              style: TextStyle(
                  color: active_color, fontFamily: 'mont_bold', fontSize: 10),
            ),
          ),
        ),
        SizedBox(
          height: 21,
        ),
        const Text(
          "O'tkazma summasi",
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'mont_bold',
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TextField(
            controller: amount,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter()
            ],
            onChanged: (s) {
              setState(() {
                summa = s;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "0 so'm",
              hintStyle: TextStyle(
                fontSize: 30,
                fontFamily: 'mont_medium',
                color: grey,
              ),
            ),
            style: const TextStyle(
                color: Colors.green, fontFamily: 'mont_bold', fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Container(
            height: 17,
            child: TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: summa.isEmpty ? "" : "Komissiya: 0.00 so'm",
                hintStyle: TextStyle(color: grey),
              ),
              style: TextStyle(
                  color: grey, fontFamily: 'mont_semibold', fontSize: 10),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                      ),
                      child: Image.asset("assets/ic_bottom_bar_payment.png",
                          width: 16, height: 16, fit: BoxFit.fill),
                      // child: Icon(Icons.),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Mening \nkartamga \no'tkazish",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'mont_semibold'),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
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
                        "Qabul \nqiluvchini \ntanlash",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'mont_semibold'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              width = 100;
            });
          },
          child: SizedBox(
            height: 40,
            width: size.width,
          ),
        ),
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
                        padding:
                            const EdgeInsets.only(left: 16, right: 12, top: 6),
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
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 8),
                      child: Image.asset("assets/ic_go_to.png",
                          width: 30, height: 30, fit: BoxFit.fill),
                    ),
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
        Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: summa.length >= 5
                ? () async {
                    setState(() {
                      width = 100;
                    });
                    await Future.delayed(Duration(milliseconds: 500));
                    setState(() {
                      width = 400;
                    });
                    await Future.delayed(Duration(microseconds: 500));
                    String summa = '';
                    amount.text.toString().split(' ').forEach((element) {
                      summa += element;
                    });
                    String my_card = '';
                    card.text.split(' ').forEach((element) {
                      my_card += element;
                    });
                    int random;
                    for (int i = 0; true; i++) {
                      random = Random().nextInt(999999);
                      if (random > 100000) {
                        break;
                      }
                    }
                    Chek chek = Chek(
                        bank: "P2P ALOQAMOBILE 2",
                        tranzaksiyaID: random.toString(),
                        who: "",
                        time: DateFormat('yyyy-MM-dd kk:mm')
                            .format(DateTime.now())
                            .toString(),
                        terminal: "1978504N2",
                        merchant: '0060200000507CS',
                        name: cardName,
                        from_card: "9860 19** **** 5917",
                        amount: summa,
                        to_card: my_card);
                    Map json = {
                      'card': card.text.trim(),
                      'amount': amount.text.trim(),
                    };
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Verify(chek, json),
                        ));
                    Timer(Duration(seconds: 2), () {
                      setState(() {
                        width = 600;
                      });
                    });
                  }
                : () {
                    print(width);
                  },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: AnimatedContainer(
                alignment: Alignment.center,
                width: width,
                curve: Curves.linear,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: summa.length >= 5 ? active_color : grey,
                ),
                duration: Duration(milliseconds: 300),
                child: Text(
                  width == 600 ? "Davom ettirish" : "",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'mont_bold',
                  ),
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Text(
                "            \"Davom ettirish\" ni bosish orqali siz            ",
                style: TextStyle(fontFamily: 'mont_medium', fontSize: 12)),
            Text("oferta shartlariga ",
                style: TextStyle(
                    fontFamily: 'mont_medium',
                    fontSize: 12,
                    color: active_color)),
            const Text("o'z roziligingizni bildirasiz",
                style: TextStyle(fontFamily: 'mont_medium', fontSize: 12)),
          ],
        )
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = new StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.maxDigits = 10});

  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }

    final oldValueText = oldValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String newValueText = newValue.text;

    // We manually remove the value we want to remove
    // If oldValueText == newValue.text it means we deleted a non digit number.
    if (oldValueText == newValue.text) {
      newValueText = newValueText.substring(0, newValue.selection.end - 1) +
          newValueText.substring(newValue.selection.end, newValueText.length);
    }
    print(newValue.text);

    String newText;
    if (newValueText.length != 0) {
      double value = double.parse(newValueText);
      final formatter =
          NumberFormat.currency(locale: 'uz', symbol: '', decimalDigits: 0);
      newText = formatter.format(value);
    } else {
      newText = "";
    }
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
