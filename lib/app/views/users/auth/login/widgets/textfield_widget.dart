import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class ReusableTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const ReusableTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: kBlack),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'Enter your $label',
          labelStyle: const TextStyle(color: kBlack),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: kBlack),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: kBlack),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
