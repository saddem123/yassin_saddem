import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/ui/views/home/add_video/add_video_view.dart';
import 'package:yassin_saddem/ui/views/home/posts/posts_view.dart';

class HomeViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<Tab> tabs = [];

  List<Widget> content = [
    const PostsView(),
    Container(),
    const AddVideoView(),
    Container(),
    Container(),
  ];

  void onTabBarChanged(int index) {
    if (index == 0 || index == 2) {
      _selectedIndex = index;
    }
    notifyListeners();
  }
}
