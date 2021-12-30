import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/ui/views/auth/auth_viewmodel.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I use the MVVM architecture as recommended and we make tabs dynamic from the model
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, AuthViewModel model, child) => DefaultTabController(
              length: model.tabs.length,
              child: Scaffold(
                backgroundColor: Theme.of(context).primaryColor,
                appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  bottom: TabBar(
                      onTap: model.onChangeTab,
                      indicatorColor: Colors.white,
                      padding: const EdgeInsets.only(right: 150),
                      tabs: model.tabs
                          .map<Tab>((e) => Tab(
                                  child: Text(
                                e.title,
                                style: const TextStyle(color: Colors.white),
                              )))
                          .toList()),
                ),
                body: TabBarView(
                  children: model.tabs.map((e) => e.body).toList(),
                ),
              ),
            ));
  }
}
