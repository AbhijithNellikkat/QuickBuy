import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/signup_controller.dart';
import 'package:quick_buy/app/models/users_model.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/auth/login/login_view.dart';
import 'package:quick_buy/app/views/users/auth/signup/widgets/form_widget.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpController>(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: SingleChildScrollView(
          child: SignUpForm(
            emailController: emailController,
            nameController: nameController,
            passwordController: passwordController,
            onSignUpPressed: () {
              signupmethod(provider, context);
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

  void signupmethod(SignUpController provider, BuildContext context) {
    final newUser = Users(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        avatar:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbackground%2F&psig=AOvVaw2o3ksdPkuuFd3Kv8KHTHbG&ust=1707822241277000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCKjdxeHTpYQDFQAAAAAdAAAAABAE");
    provider.createUser(user: newUser);
    emailController.clear();
    passwordController.clear();
    nameController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        elevation: 5,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        content: Text('Signup Successful'),
      ),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }
}
