import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final double size;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final bool isIcon;

  const AppButton({
    super.key,
    required this.size,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    this.isIcon = false,
    this.text = '1',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.0,
          color: borderColor,
        ),
      ),
      child: Center(
        child: isIcon == false
            ? AppText(
                text: text,
                color: textColor,
              )
            : Icon(
                Icons.favorite_border,
                color: textColor,
              ),
      ),
    );
  }
}
