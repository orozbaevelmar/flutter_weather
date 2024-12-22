import 'package:flutter/material.dart';
import 'package:flutter_weather/constants/color.dart';
import 'package:flutter_weather/constants/text_style.dart';

class CenterText extends StatelessWidget {
  final String text;
  final double? height;

  const CenterText({
    super.key,
    required this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: MTextStyle.big(MColor.green),
        ),
      ),
    );
  }
}
