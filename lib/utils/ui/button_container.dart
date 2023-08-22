import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final Text label;
  final Function() onPressed;
  final bool isButtonColored;
  const ButtonContainer({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isButtonColored = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return isButtonColored ? Colors.blue[300]! : Colors.white;
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: isButtonColored ? Colors.white : Colors.blue[300],
          ),
          child: label,
        ),
      ),
    );
  }
}
