import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomrad/constant.dart';

String? cardName;

class Koproq extends StatefulWidget {
  const Koproq({Key? key}) : super(key: key);

  @override
  State<Koproq> createState() => _KoproqState();
}

class _KoproqState extends State<Koproq> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
          ),
          child: TextField(
            style: const TextStyle(
              fontFamily: 'mont_semibold',
              color: Colors.black,
            ),
            onChanged: (s) {
              setCardName(s);
            },
            keyboardType: TextInputType.text,
            // inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Ismi',
            ),
          ),
        ),
      ],
    );
  }
}
