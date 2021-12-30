import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/app/theme.dart';
import 'package:yassin_saddem/ui/views/home/posts/posts_viewmodel.dart';
import 'package:yassin_saddem/ui/widgets/post_card.dart';
import 'package:yassin_saddem/utils/size_config.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ViewModelBuilder<PostViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.safeBlockVertical * 25),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: blueShadowColor.withAlpha(16),
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 20),
              child: ListTile(
                leading: Container(
                  height: 59,
                  width: 59,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 4),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      model.user.avatarUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                title: Text(
                  model.user.userName,
                  style: TextStyle(
                      color: blueTextColor, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  model.user.bio ?? "",
                  style: TextStyle(color: greyTextColor, fontSize: 10),
                ),
                trailing: SvgPicture.asset("assets/svgs/Search.svg"),
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // fetch list again if there is any update
          },
          child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 20),
              itemCount: model.allPosts.length,
              itemBuilder: (BuildContext context, index) {
                return PostCard(post: model.allPosts[index]);
              }),
        ),
      ),
      viewModelBuilder: () => PostViewModel(),
    );
  }
}
