import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget{
  final String? placeholder;
  const InputText({this.placeholder
  });
  @override 
  Widget build(BuildContext context){
    return TextField(
      
      style: GoogleFonts.inter(
                  fontSize: 16,
                   color: Colors.white
                   ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                                        ) ,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                  
                  labelText: placeholder,
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2)
                   ),

    );
  }
}
