import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomrad/screens/home.dart';

import '../constant.dart';
import '../model/chek.dart';
import 'chek_seen.dart';

class Yakunlandi extends StatefulWidget {
  Yakunlandi(this.chek,{Key? key}) : super(key: key);
  Chek chek;

  @override
  State<Yakunlandi> createState() => _YakunlandiState();
}

class _YakunlandiState extends State<Yakunlandi> {
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
            onPressed: () { Navigator.pop(context);},
            icon: const Padding(
                padding: EdgeInsets.only(left: 2),
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
          const SizedBox(
            height: 54,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 94,right: 94,top: 104),
            child: Image.asset("assets/ic_success.png"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 28),
            child: Text(
              "Amaliyot muvaffaqiyatli yakunlandi",
              style: TextStyle(
                  color: Colors.black, fontSize: 16, fontFamily: 'mont_semibold'),
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(child: Container(),),
              Expanded(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ChekSeen(widget.chek),));
                      },
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
                            child: Image.asset("assets/ic_unhide.png",
                                width: 16, height: 16, ),
                            // child: Icon(Icons.),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: const Text(
                              "Checkni\nko'rish",
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
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context, CupertinoPageRoute(builder: (context) => Home(),));
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
                  child: Text(
                    "Asosiy sahifa",
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
