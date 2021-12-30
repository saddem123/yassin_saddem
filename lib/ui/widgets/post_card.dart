import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yassin_saddem/app/theme.dart';
import 'package:yassin_saddem/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: blueShadowColor.withAlpha(27),
                spreadRadius: 5,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  // padding: const EdgeInsets.all(4),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: backgroundGreyColor),
                  child: Image.asset(
                    post.userAvatarUrl,
                    width: 50,
                    height: 50,
                  ),
                ),
                title: Text(
                  post.userName,
                  style: TextStyle(
                    fontSize: 15,
                    color: blueTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Row(
                  children: [
                    const Icon(
                      Icons.public,
                      size: 9,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      post.posteDate,
                      style: TextStyle(
                        color: greyTextColor,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/svgs/Star.svg"),
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 1, right: 1),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                          size: 18,
                        )),
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      post.description ?? "",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Image.asset(post.videoUrl),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Icon(
                            Icons.play_circle_filled_outlined,
                            color: greyTextColor,
                            size: 70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      post.videoTitle,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Row(
                  children: [
                    actionWidget(assetImage: "assets/svgs/Like.svg"),
                    const SizedBox(
                      width: 20,
                    ),
                    actionWidget(assetImage: "assets/svgs/Comment.svg"),
                    const SizedBox(
                      width: 20,
                    ),
                    actionWidget(assetImage: "assets/svgs/share.svg"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionWidget({required String assetImage}) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: SvgPicture.asset(assetImage),
      width: 35,
      height: 35,
    );
  }
}
