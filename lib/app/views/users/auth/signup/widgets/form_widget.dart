import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/auth/signup/widgets/button_widget.dart';
import 'package:quick_buy/app/views/users/auth/signup/widgets/textfield_widget.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    this.formKey,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.onSignUpPressed,
    this.onLoginPressed,
  }) : super(key: key);

  final GlobalKey<FormState>? formKey;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onSignUpPressed;
  final VoidCallback? onLoginPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.04),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SignUpTextField(
              label: 'User name',
              controller: nameController!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              }),
          SizedBox(height: screenHeight * 0.02),
          SignUpTextField(
            label: 'Email',
            controller: emailController!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(
                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          SignUpTextField(
            label: 'Password',
            controller: passwordController!,
            obscureText: true,
            validator: (value) {},
          ),
          SizedBox(height: screenHeight * 0.06),
          SignUpButton(onPressed: onSignUpPressed!),
          SizedBox(height: screenHeight * 0.02),
          GestureDetector(
            onTap: onLoginPressed,
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(fontSize: screenWidth * 0.035, color: kBlack),
                children: [
                  TextSpan(
                    text: "Log In",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      // color: ,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
