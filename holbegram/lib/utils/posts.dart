import 'package:flutter/material.dart';
// firebase stuff
import 'package:holbegram/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holbegram/models/posts.dart';
import 'package:holbegram/screens/Pages/methods/post_storage.dart';

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

          // LISTVIEW OF POSTS
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final QueryDocumentSnapshot<Map<String, dynamic>> document = data[index];
              final Post postModel = Post.fromSnap(document);

              // POST (header, caption image)
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsGeometry.lerp(const EdgeInsets.all(8), const EdgeInsets.all(8), 10),
                  height: 540,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  // HEADER, CAPTION, IMAGE, LIKES
                  child: Column(
                    children: <Widget>[
                      // POST HEADER: (profImage, username and "..." delete button)
                      Builder(
                        builder: (BuildContext context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // PROFIMAGE
                              Image.network(postModel.profImage),
                              // CAPTION
                              Text(postModel.username),
                              const Spacer(),
                              // ... (DELETE POST BUTTON)
                              IconButton(
                                onPressed: () {
                                  PostStorage().deletePost(postModel.postId);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Post Deleted')),
                                  );
                                },
                                icon: const Icon(Icons.more_horiz),
                              )
                            ],
                          );
                        }
                      ),
                      // CAPTION
                      Text(postModel.caption),
                      // IMAGE
                      Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.network(postModel.postUrl),
                        // fit: cover (how?)
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () { },
                            icon: const Icon(Icons.favorite_outline),
                          ),
                          IconButton(
                            onPressed: ( ) { },
                            icon: const Icon(Icons.messenger_outline),
                          ),
                          IconButton(
                            onPressed: ( ) { },
                            icon: const Icon(Icons.send),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: ( ) { },
                            icon: const Icon(Icons.bookmark_outline),
                          ),
                        ],
                      ),
                      // LIKES
                      Text('${postModel.likes.length} Liked'),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return const Center(child: Text('Fetching posts data...'));
      }
    );
  }
}
