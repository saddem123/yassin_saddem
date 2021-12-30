import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/ui/views/home/home_viewmodel.dart';

class AddVideoModelView extends BaseViewModel {
  onSubmit(BuildContext context) {
    // navigate to posts list
    Provider.of<HomeViewModel>(context, listen: false).onTabBarChanged(0);
  }
}
