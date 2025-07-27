import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final VoidCallback onPress;

  const AppButton({
    super.key,
    required this.text,
    required this.onPress,
    this.buttonStyle,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: buttonStyle,
      onPressed: onPress,
      icon: icon,
      label: Text(
        textAlign: TextAlign.center,
        text.toUpperCase(),
        style: textStyle,
      ),
    );
  }
}
