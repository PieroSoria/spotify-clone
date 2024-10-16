import 'package:flutter/material.dart';
import 'package:my_app/core/helper/styles_text.dart';

class ButtonCustomAuth extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets padding;
  const ButtonCustomAuth({
    super.key,
    required this.onPressed,
    required this.title,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 53, 238, 59),
          minimumSize: Size(double.infinity, 40),
        ),
        child: Text(
          title,
          style: StylesText.robotoBold(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
