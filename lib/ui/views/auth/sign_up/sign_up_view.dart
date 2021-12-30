import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/ui/views/auth/sign_up/sign_up_viewmodel.dart';
import 'package:yassin_saddem/utils/auth_form_field_utils.dart';
import 'package:yassin_saddem/utils/hex_color.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  static const spaceBettweenFields = 25.0;

  Widget termOfUse(BuildContext context, SignUpViewModel model) {
    return Row(
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Checkbox(
            checkColor: Theme.of(context).primaryColor,
            activeColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.white),
            value: model.termOfUse,
            onChanged: model.onTermOfUseClick,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: "I agree to  ", style: TextStyle(color: Colors.white)),
              TextSpan(
                  text: "Terms & conditions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget signUpBtn(SignUpViewModel model) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(HexColor("256168"))),
              onPressed: model.onSubmit,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, SignUpViewModel model, child) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Form(
            key: model.formKey,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svgs/Sign up.svg",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: model.firstNameController,
                  focusNode: model.firstNameFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: outlinedBorder,
                    enabledBorder: outlinedBorder,
                    border: outlinedBorder,
                    labelStyle: const TextStyle(color: Colors.white),
                    label: const Text("FirstName"),
                  ),
                  style: inputTextStyle,
                  cursorColor: cursorColor,
                ),
                const SizedBox(
                  height: spaceBettweenFields,
                ),
                TextFormField(
                  controller: model.nameController,
                  focusNode: model.nameFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: outlinedBorder,
                    enabledBorder: outlinedBorder,
                    border: outlinedBorder,
                    labelStyle: const TextStyle(color: Colors.white),
                    label: const Text("Name"),
                  ),
                  style: inputTextStyle,
                  cursorColor: cursorColor,
                ),
                const SizedBox(
                  height: spaceBettweenFields,
                ),
                TextFormField(
                  controller: model.emailControler,
                  focusNode: model.emailFocusNode,
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
                const SizedBox(
                  height: spaceBettweenFields,
                ),
                TextFormField(
                  controller: model.passwordController,
                  focusNode: model.passwordFocusNode,
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
                  height: spaceBettweenFields,
                ),
                TextFormField(
                  controller: model.confirmPasswordController,
                  focusNode: model.confirmPasswordFocusNode,
                  decoration: InputDecoration(
                      focusedBorder: outlinedBorder,
                      enabledBorder: outlinedBorder,
                      border: outlinedBorder,
                      labelStyle: const TextStyle(color: Colors.white),
                      label: const Text("Confirm password"),
                      suffix: GestureDetector(
                        child: Icon(
                          model.obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        onTap: model.obsucreConfirmPasswordStatusChange,
                      )),
                  style: inputTextStyle,
                  cursorColor: cursorColor,
                ),
                const SizedBox(
                  height: spaceBettweenFields,
                ),
                termOfUse(context, model),
                const SizedBox(
                  height: spaceBettweenFields,
                ),
                signUpBtn(model)
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
