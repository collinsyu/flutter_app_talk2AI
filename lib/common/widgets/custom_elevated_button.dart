import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/coloors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
          onPressed: onPressed,
          
          child: Text(text)),
    );
  }
}
