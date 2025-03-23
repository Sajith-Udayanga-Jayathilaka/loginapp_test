import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fWeight;
  final Color color;
  final TextOverflow textOverflow;

  const CustomText({
    required this.text,
    this.fontSize = 24,
    this.fWeight = FontWeight.w600,
    this.color = Colors.black,
    this.textOverflow = TextOverflow.visible,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style:TextStyle(
        fontSize: fontSize,
        fontWeight: fWeight,
        color: color
    ),
    overflow: textOverflow,
    );
  }
}