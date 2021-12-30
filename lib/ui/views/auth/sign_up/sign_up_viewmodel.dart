import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailControler = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  bool obscurePassord = true;
  bool obscureConfirmPassword = true;
  bool termOfUse = false;

  void obsucrePasswordStatusChange() {
    obscurePassord = !obscurePassord;
    notifyListeners();
  }

  void onTermOfUseClick(bool? status) {
    termOfUse = status ?? false;
    notifyListeners();
  }

  void obsucreConfirmPasswordStatusChange() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void onSubmit() {
    if (formKey.currentState!.validate() && termOfUse) {
      // TODO signIN
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    nameController.dispose();
    emailControler.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    firstNameFocusNode.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
