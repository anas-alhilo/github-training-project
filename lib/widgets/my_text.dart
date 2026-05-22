import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontFamily = 'poppins',
    this.textAlign = TextAlign.center,
  });

  final String text;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
