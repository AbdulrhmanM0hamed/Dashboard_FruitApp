import 'package:dashboard/core/utils/constants/font_manger.dart';
import 'package:dashboard/core/utils/constants/styles_manger.dart';

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        buttonText,
        style: getBoldStyle(
                    fontFamily: FontConstant.cairo, fontSize: FontSize.size18),
      ),
    );
  }
}