import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/ui/views/auth/sign_in/sign_in_view.dart';
import 'package:yassin_saddem/ui/views/auth/sign_up/sign_up_view.dart';

class AuthViewModel extends BaseViewModel {
  final String _title = 'Auth view';
  int _tabIndex = 0;
  final _tabs = const [
    AuthTab(title: "Log In", body: SignInView()),
    AuthTab(title: "Sign Up", body: SignUpView())
  ];

  String get title => _title;
  int get tabIndex => _tabIndex;
  List<AuthTab> get tabs => _tabs;

  void onChangeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}

class AuthTab {
  final String title;
  final Widget body;

  const AuthTab({required this.title, required this.body});
}
