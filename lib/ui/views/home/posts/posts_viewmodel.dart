import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/models/post.dart';
import 'package:yassin_saddem/models/user.dart';

class PostViewModel extends BaseViewModel {
  final String _title = 'posts view';
  final _user = User(
      userName: "Daniela Fernández Ramos",
      bio: "Lorem ipsum dolor sit amet, consetetur sadipscing",
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
}
