class Post {
  String? description;
  String userName;
  String videoUrl;
  // TODO change it to dateTime
  String posteDate;
  String userAvatarUrl;
  String videoTitle;

  Post(
      {this.description,
      required this.userName,
      required this.videoUrl,
      required this.posteDate,
      required this.userAvatarUrl,
      required this.videoTitle});
}
