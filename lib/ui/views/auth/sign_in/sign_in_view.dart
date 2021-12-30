import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/ui/views/auth/sign_in/sign_in_viewmodel.dart';
import 'package:yassin_saddem/utils/auth_form_field_utils.dart';
import 'package:yassin_saddem/utils/hex_color.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  Widget signInBtn(BuildContext context, SignInViewModel model) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(HexColor("134147"))),
              onPressed: () => model.onSubmit(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }

  Widget signInWithGoogleBtn(BuildContext context, SignInViewModel model) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(HexColor("256168"))),
              onPressed: () => model.onSubmit(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/google.svg"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Log in with Google",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget or() {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 1,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))),
        )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
            child: Container(
          height: 1,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, SignInViewModel model, child) =>
            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                  // TODO add validators
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/Log in.svg",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          model.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: model.emailController,
                          focusNode: model.emailFocus,
                          decoration: InputDecoration(
                            focusedBorder: outlinedBorder,
                            enabledBorder: outlinedBorder,
                            border: outlinedBorder,
                            labelStyle: const TextStyle(color: Colors.white),
                            label: const Text("Email"),
                          ),
                          style: inputTextStyle,
                          cursorColor: cursorColor,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: model.passwordController,
                          focusNode: model.passwordFocus,
                          obscureText: model.obscurePassord,
                          decoration: InputDecoration(
                              focusedBorder: outlinedBorder,
                              enabledBorder: outlinedBorder,
                              border: outlinedBorder,
                              labelStyle: const TextStyle(color: Colors.white),
                              label: const Text("Password"),
                              suffix: GestureDetector(
                                child: Icon(
                                  model.obscurePassord
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                onTap: model.obsucrePasswordStatusChange,
                              )),
                          style: inputTextStyle,
                          cursorColor: cursorColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // forget password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                child: const Text(
                              "Forget Password ?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        signInBtn(context, model),
                        const SizedBox(height: 30),
                        or(),
                        const SizedBox(
                          height: 30,
                        ),
                        signInWithGoogleBtn(context, model)
                      ],
                    ),
                  )),
            ));
  }
}
