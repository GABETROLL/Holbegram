import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:holbegram/screens/auth/methods/user_storage.dart';
import 'package:holbegram/models/posts.dart';

class PostStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    final String imageUrl;

    try {
      imageUrl = await StorageMethods().uploadImageToStorage(true, StorageMethods.childName, image);
    } catch (error) {
      return error.toString();
    }

    final String postId = (const Uuid()).v1();
    final DateTime now = DateTime.now();

    final Post postModel = Post(
      caption: caption,
      uid: uid,
      username: username,
      likes: [],
      postId: postId,
      datePublished: now,
      postUrl: imageUrl,
      profImage: profImage,
    );

    try {
      _firestore.collection('posts').doc(postId).set(postModel.toJson());
    } catch (error) {
      return error.toString();
    }

    return 'Ok';
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (error) {
      print("Error deleting post with ID '$postId':\n$error");
    }
  }
}
