import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/app/routes.dart';

class SignInViewModel extends BaseViewModel {
  final String title = "Log In to Account";
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  bool obscurePassord = true;

  void obsucrePasswordStatusChange() {
    obscurePassord = !obscurePassord;
    notifyListeners();
  }

  void onSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(homeRoute);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
}
