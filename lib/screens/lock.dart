import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoomrad/screens/home.dart';

import '../constant.dart';

class Lock extends StatefulWidget {
  const Lock({Key? key}) : super(key: key);

  @override
  State<Lock> createState() => _LockState();
}

class _LockState extends State<Lock> {
  bool pin1 = false;
  bool pin2 = false;
  bool pin3 = false;
  bool pin4 = false;

  Color active = Color(0xFF169C77);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 70,
            ),
            Image.asset(
              "assets/ic_zoomrad_registration.png",
              width: 100,
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              "PIN kiriting",
              style: TextStyle(
                fontFamily: 'mont_semibold',
                fontSize: 15
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: !pin1 ? Colors.white : active,
                          shape: BoxShape.circle,
                          border: Border.all(color: grey, width: 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: !pin2 ? Colors.white : active,
                          shape: BoxShape.circle,
                          border: Border.all(color: grey, width: 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: !pin3 ? Colors.white : active,
                          shape: BoxShape.circle,
                          border: Border.all(color: grey, width: 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: !pin4 ? Colors.white : active,
                          shape: BoxShape.circle,
                          border: Border.all(color: grey, width: 1)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "PIN qayta ornatish",
              style: TextStyle(
                // decorationThickness: 2,
                height: 1,
                decoration: TextDecoration.underline,
                fontFamily: 'mont_semibold',
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  pin("1"),
                  pin("2"),
                  pin("3"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  pin("4"),
                  pin("5"),
                  pin("6"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  pin("7"),
                  pin("8"),
                  pin("9"),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontFamily: 'mont_medium', fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: ()async{
                      if (!pin1) {
                        setState(() {
                          pin1 = true;
                        });
                        return;
                      }
                      if (!pin2) {
                        setState(() {
                          pin2 = true;
                        });
                        return;
                      }
                      if (!pin3) {
                        setState(() {
                          pin3 = true;
                        });
                        return;
                      }
                      if (!pin4) {
                        setState(() {
                          pin4 = true;
                        });
                      }
                      await Future.delayed(Duration(milliseconds: 200));
                      if(pin1 && pin2 && pin3 && pin4){
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Home(),));
                      }
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontFamily: 'mont_medium', fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 20),
                      child: Icon(Icons.backspace),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget pin(String num) {
    return Expanded(
      child: InkWell(
        onTap: () async{
          if (!pin1) {
            setState(() {
              pin1 = true;
            });
            return;
          }
          if (!pin2) {
            setState(() {
              pin2 = true;
            });
            return;
          }
          if (!pin3) {
            setState(() {
              pin3 = true;
            });
            return;
          }
          if (!pin4) {
            setState(() {
              pin4 = true;
            });
          }
          await Future.delayed(Duration(milliseconds: 200));
          if(pin1 && pin2 && pin3 && pin4){
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Home(),));
          }
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              num,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'mont_medium', fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
