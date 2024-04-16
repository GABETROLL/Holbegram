import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  const Users({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
    required this.posts,
    required this.saved,
    required this.searchKey
  });

  final String uid;
  final String email;
  final String username;
  final String bio;
  final String photoUrl;
  final List<dynamic> followers;
  final List<dynamic> following;
  final List<dynamic> posts;
  final List<dynamic> saved;
  final String searchKey;

  static Users fromSnap(DocumentSnapshot<Map<String, dynamic>> snap) {
    final Map<String, dynamic>? snapshot = snap.data();

    return Users(
      uid: snapshot?['uid'],
      email: snapshot?['email'],
      username: snapshot?['username'],
      bio: snapshot?['bio'],
      photoUrl: snapshot?['photoUrl'],
      followers: snapshot?['followers'],
      following: snapshot?['following'],
      posts: snapshot?['posts'],
      saved: snapshot?['saved'],
      searchKey: snapshot?['searchKey'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'username': username,
    'bio': bio,
    'photoUrl': photoUrl,
    'followers': followers,
    'following': following,
    'posts': posts,
    'saved': saved,
    'searchKey': searchKey,
  };
}
