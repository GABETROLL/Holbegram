class Post {
  Post({
    required this.caption,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  String caption;
  String uid;
  String username;
  List likes;
  String postId;
  DateTime datePublished;
  String postUrl;
  String profImage;

  // static Post fromJson(DocumentSnapshot snap);

  Map<String, dynamic> toJson() => {
    'caption': caption,
    'uid': uid,
    'username': username,
    'likes': likes,
    'postId': postId,
    'datePublished': datePublished,
    'postUrl': postUrl,
    'profImage': profImage,
  };
}
