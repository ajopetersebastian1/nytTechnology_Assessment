import 'package:flutter/cupertino.dart';

import '../../constants/styles.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double fintsize;
  final TextDecoration decoration;
  final FontWeight textFontWeight;

  const CustomTextWidget(
      {super.key,
      required this.text,
      this.textcolor = kBlack,
      this.fintsize = 16,
      this.textFontWeight = FontWeight.normal,
      this.decoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) => _widgetView();
  _widgetView() => Text(
        text,
        style: TextStyle(
            color: textcolor,
            fontSize: fintsize,
            fontWeight: textFontWeight,
            decoration: decoration),
      );
}
