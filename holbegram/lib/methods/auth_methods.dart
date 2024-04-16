import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class AuthMethods {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<String> login({required String email, required String password}) async {
    if (email == '' || password == '') {
      return 'Please fill all the fields';
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      print('ERROR CAUGHT: $error');
      return 'unexpected failure';
    }
  }

  static Future<String> signUpUser({required String email, required String password, required String username, Uint8List? file}) async {
    if (email == '' || password == '' || username == '') {
      return 'Please fill all the fields';
    }

    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user == null || user.email == null) {
        return 'failed to sign up the user';
      }

      final Users userModel = Users(
          uid: user.uid,
          email: user.email!,
          username: username,
          bio: '',
          photoUrl: '',
          followers: [],
          following: [],
          posts: [],
          saved: [],
          searchKey: '',
        );

      try {
        await _firestore.collection('users').doc(userModel.uid).set(userModel.toJson());
      } catch (error) {
        return 'Error adding new user to Cloud Firestore: $error';
      }
      return 'success';
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      print('ERROR CAUGHT: $error');
      return 'unexpected failure';
    }
  }
}
