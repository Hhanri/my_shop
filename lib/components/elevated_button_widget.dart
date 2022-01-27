import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {

  final Color backgroundColor;
  final String textToDisplay;
  final VoidCallback onClickCallBack;

  const ElevatedButtonWidget({
    Key? key, required this.backgroundColor,
    required this.textToDisplay,
    required this.onClickCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                backgroundColor
            )
        ),
        onPressed: onClickCallBack,
        child: Text(
          textToDisplay,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),
        )
    );
  }
}