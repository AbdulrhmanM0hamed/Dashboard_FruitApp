import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.suffixIcon,  this.obsacureText= false, required this.keyboardType, });
  final String hintText;
  final Widget? suffixIcon;
 final TextInputType keyboardType;

 final bool obsacureText ; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      obscureText: obsacureText,
      decoration: InputDecoration(
        hintText:hintText ,
        suffixIcon: suffixIcon ,
      ),
    );
  }
}