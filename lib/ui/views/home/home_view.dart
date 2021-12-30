import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/app/theme.dart';
import 'package:yassin_saddem/ui/views/home/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: model.content[model.selectedIndex],
          bottomNavigationBar: SizedBox(
            height: 67,
            //selectedFontSize: 0,
            // type: BottomNavigationBarType.fixed,
            // currentIndex: model.selectedIndex,
            // onTap: model.onTabBarChanged,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customBottonNavigationBarItem(context,
                    itemIndex: 0,
                    currentIndex: model.selectedIndex,
                    onItemClick: model.onTabBarChanged,
                    icon: "assets/svgs/Home Gray color.svg",
                    activeIcon: "assets/svgs/Home Black color.svg"),
                customBottonNavigationBarItem(context,
                    onItemClick: model.onTabBarChanged,
                    itemIndex: 1,
                    currentIndex: model.selectedIndex),
                customBottonNavigationBarItem(
                  context,
                  onItemClick: model.onTabBarChanged,
                  currentIndex: model.selectedIndex,
                  itemIndex: 2,
                  widget: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: primaryColorShadow.withAlpha(50),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                customBottonNavigationBarItem(context,
                    onItemClick: model.onTabBarChanged,
                    itemIndex: 3,
                    currentIndex: model.selectedIndex),
                customBottonNavigationBarItem(context,
                    onItemClick: model.onTabBarChanged,
                    itemIndex: 4,
                    currentIndex: model.selectedIndex),
              ],
            ),
          )),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget customBottonNavigationBarItem(BuildContext context,
      {required int itemIndex,
      required int currentIndex,
      required Function onItemClick,
      String? icon,
      String? activeIcon,
      Widget? widget}) {
    return GestureDetector(
      onTap: () => onItemClick(itemIndex),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          currentIndex == itemIndex
              ? Container(
                  height: 4,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      )),
                )
              : const SizedBox(
                  height: 4,
                ),
          bottomItemBarIcon(
              currentIndex: currentIndex,
              itemIndex: itemIndex,
              widget: widget,
              activeIcon: activeIcon,
              icon: icon),
        ],
      ),
    );
  }

  Widget bottomItemBarIcon(
      {Widget? widget,
      required int currentIndex,
      required int itemIndex,
      String? activeIcon,
      String? icon}) {
    return widget ??
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            child: currentIndex == itemIndex
                ? SvgPicture.asset(activeIcon ?? "assets/svgs/Block.svg")
                : SvgPicture.asset(icon ?? "assets/svgs/Block.svg"));
  }
}
