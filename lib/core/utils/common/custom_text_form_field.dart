import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.obsacureText = false,
    required this.keyboardType,
    this.onSaved,
  });

  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obsacureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obsacureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب'; // رسالة الخطأ
        }
        return null; // إذا كانت القيمة صحيحة
      },
    );
  }
}
