import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomrad/constant.dart';
import 'package:zoomrad/screens/pages/asosiy.dart';
import 'package:zoomrad/screens/pages/koproq.dart';
import 'package:zoomrad/screens/pages/monitoring.dart';
import 'package:zoomrad/screens/pages/otkazma.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int id = 0;
  Color select = Colors.green;
  List title = ["", "", "Kartadan kartaga pul o'tkazmasi", "Monitoring", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: back,
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: back,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: back,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          leading: IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Image.asset("assets/ic_hamburg_menu.png",
                    width: 18, height: 18),
              )),
          title: Text(
            title[id],
            style:
                TextStyle(color: grey, fontSize: 13, fontFamily: 'mont_medium'),
          ),
          actions: [
            id != 3
                ? Padding(
                    padding:
                        const EdgeInsets.only(right: 22, bottom: 5, top: 5),
                    child: Image.asset(
                      "assets/ic_notification.png",
                      width: 14,
                      height: 14,
                    ))
                : Padding(
                    padding:
                        const EdgeInsets.only(right: 22, bottom: 5, top: 5),
                    child: Image.asset(
                      "assets/ic_filter.png",
                      width: 19,
                      height: 19,
                    )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: id,
          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'mont_medium',
            fontSize: 8,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'mont_medium',
            fontSize: 8,
          ),
          fixedColor: select,
          unselectedItemColor: Colors.black,
          // showSelectedLabels: false,
          onTap: (index) {
            setState(() {
              id = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/ic_bottom_bar_main.png",
                    height: 22,
                    width: 22,
                    color: id == 0 ? select : Colors.black),
                label: "Asosiy"),
            BottomNavigationBarItem(
                icon: Image.asset("assets/ic_bottom_bar_payment.png",
                    height: 22,
                    width: 22,
                    color: id == 1 ? select : Colors.black),
                label: "To'lovlar"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/ic_bottom_bar_p2p.png",
                  height: 22,
                  width: 22,
                  color: id == 2 ? select : Colors.black,
                ),
                label: "O'tkazma"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/ic_bottom_bar_monitoring.png",
                  height: 22,
                  width: 22,
                  color: id == 3 ? select : Colors.black,
                ),
                label: "Monitoring"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/ic_bottom_bar_more.png",
                  height: 22,
                  width: 22,
                  color: id == 4 ? select : Colors.black,
                ),
                label: "Ko'proq"),
          ],
        ),
        body: IndexedStack(
          index: id,
          children: [
            const Asosiy(),
            Container(),
            const Otkazma(),
            const Monitoring(),
            Koproq(),
          ],
        ));
  }
}
