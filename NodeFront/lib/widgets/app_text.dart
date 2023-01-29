import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget{
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  AppText(this.text, {this.textAlign, this.color});

  @override 
  Widget build(BuildContext context){
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Colors.white,
      ),
      );

  }
}