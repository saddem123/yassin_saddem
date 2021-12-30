import 'package:flutter/material.dart';
import 'package:yassin_saddem/app/routes.dart';
import 'package:yassin_saddem/app/theme.dart';
import 'package:yassin_saddem/ui/views/auth/auth_view.dart';
import 'package:yassin_saddem/ui/views/home/home_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: primaryColor, primaryColor: primaryColor),
      // we work with this routing to win some time
      // TODO with work navigation 2.0 library like auto_route or beamer
      initialRoute: authRoute,
      routes: {
        authRoute: (context) => const AuthView(),
        homeRoute: (context) => const HomeView()
      },
    );
  }
}
