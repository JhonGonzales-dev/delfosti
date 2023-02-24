import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget(
      {super.key,
      this.isloading = false,
      required this.onpress,
      required this.color,
      required this.text,
      required this.isBorderSide,
      required this.borderRadius});
  final VoidCallback onpress;
  final Color color;
  final String text;
  final bool isBorderSide;
  final double borderRadius;
  final bool? isloading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: isBorderSide ? null : color,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isBorderSide ? Colors.grey : Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.symmetric(
            horizontal: 50, vertical: isBorderSide ? 13 : 10),
        onPressed: onpress,
        child: isloading!
            ? const SizedBox(
                height: 15, width: 60, child: CircularProgressIndicator())
            : Text(text,
                style: TextStyle(
                    color: isBorderSide ? Colors.blueAccent : Colors.white)));
  }
}
