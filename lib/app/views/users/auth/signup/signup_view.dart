import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/auth/login/login_view.dart';
import 'package:quick_buy/app/views/users/auth/signup/widgets/form_widget.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: SingleChildScrollView(
          child: SignUpForm(
            emailController: controller,
            nameController: controller,
            passwordController: controller,
            onSignUpPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginView(),
              ));
            },
            onLoginPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginView(),
              ));
            },
          ),
        ),
      ),
    );
  }
}
