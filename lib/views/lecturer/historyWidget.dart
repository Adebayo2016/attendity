import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_svg/svg.dart';

class historyWidget extends StatefulWidget {
  const historyWidget({super.key});

  @override
  State<historyWidget> createState() => _historyWidgetState();
}

class _historyWidgetState extends State<historyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SvgPicture.asset(
            'assets/images/gra1.svg',
            semanticsLabel: 'Attendity graph',
            height: 250,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(

          child: SvgPicture.asset(
            'assets/images/gra3.svg',
            semanticsLabel: 'Attendity graph',
            height: 300,
          ),
        ),
      ],

    );
  }
}
