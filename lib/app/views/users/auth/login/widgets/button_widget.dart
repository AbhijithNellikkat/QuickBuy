import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kWhite,
        side: BorderSide(color: kWhite, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Container(
        width: screenWidth * 0.75,
        height: screenHeight * 0.07,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: kWhite,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
