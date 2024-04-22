import 'package:cloud_firestore/cloud_firestore.dart';

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

  /// Assumes that `snap.data()` can't be null!
  /// TODO: MAKE THIS CHECK IF THE `datePublished` KEY
  /// IS A `TimeStamp` INSTEAD OF A `DateTime`, AND CONVERT IT.
  static Post fromSnap(DocumentSnapshot<Map<String, dynamic>> snap) {
    final Map<String, dynamic>? data = snap.data();

    return Post(
      caption: data?['caption'],
      uid: data?['uid'],
      username: data?['username'],
      likes: data?['likes'],
      postId: data?['postId'],
      datePublished: data?['datePublished'],
      postUrl: data?['postUrl'],
      profImage: data?['profImage'],
    );
  }

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
