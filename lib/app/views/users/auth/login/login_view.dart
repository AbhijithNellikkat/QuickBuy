// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/auth/login/widgets/textfield_widget.dart';
import 'package:quick_buy/app/views/users/auth/signup/signup_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, right: 100),
                child: Text.rich(
                  TextSpan(
                    text: "Hi , Welcome 👋",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                    ),
                    children: [],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(color: kBlack),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ReusableTextField(
                label: 'Email',
                controller: controller,
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'password',
                    style: TextStyle(color: kBlack),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ReusableTextField(
                label: 'Password',
                controller: controller,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: kBlack),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlack,
                  side: BorderSide(color: kBlack, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Container(
                  width: 300,
                  height: 61,
                  child: const Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Divider(
                        color: kBlack,
                        height: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Divider(
                        color: kBlack,
                        height: 30,
                        endIndent: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpView(),
                  ));
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(fontSize: 14, color: kBlack),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          // color: ,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
