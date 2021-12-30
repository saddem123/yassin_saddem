import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/models/post.dart';
import 'package:yassin_saddem/models/user.dart';

class PostViewModel extends BaseViewModel {
  final String _title = 'posts view';
  final _user = User(
      userName: "Daniela Fernández Ramos",
      bio: "Lorem ipsum dolor sit amet",
      avatarUrl: "assets/images/user1.png");
  late FToast fToast;

  final List<Post> allPosts = [
    Post(
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Daniela Fernández Ramos",
        videoTitle: "Video Name",
        videoUrl: "assets/images/post1.png",
        posteDate: "1 minutes",
        userAvatarUrl: "assets/images/user1.png"),
    Post(
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Lorem ipsum",
        videoTitle: "Video Name",
        videoUrl: "assets/images/post2.png",
        posteDate: "3 minutes",
        userAvatarUrl: "assets/images/avatar.png"),
    Post(
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Lorem ipsum",
        videoTitle: "Video Name",
        videoUrl: "assets/images/post3.png",
        posteDate: "5 minutes",
        userAvatarUrl: "assets/images/avatar.png"),
  ];

  String get title => _title;

  User get user => _user;

  void showAddedToast(BuildContext context) {
    fToast.showToast(
      child: InkWell(
        onTap: () {
          fToast.removeQueuedCustomToasts();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svgs/check.svg"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Your video has been uploaded",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/svgs/Close.svg"),
              ],
            ),
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
