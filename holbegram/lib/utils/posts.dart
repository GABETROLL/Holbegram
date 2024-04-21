import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:holbegram/providers/user_provider.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final _user_provider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error!}', style: const TextStyle(color: Colors.red));
        }

        if (snapshot.hasData) {
          List<QueryDocumentSnapshot<Map<String, dynamic>>> data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final QueryDocumentSnapshot<Map<String, dynamic>> document = data[index];
              final Map<String, dynamic> documentData = document.data();

              return SingleChildScrollView(
                child: Container(
                  /* USE `documentData` HERE */
                ),
              );
            },
          );
        }

      }
    );
  }
}
