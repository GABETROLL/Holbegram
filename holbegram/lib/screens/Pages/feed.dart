import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo.webp'),
        title: const Text('Holbegram', style: TextStyle(fontFamily: 'Billabong', fontSize: 50)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () { },
          ),
          IconButton(
            icon: const Icon(Icons.message_outlined),
            onPressed: () { },
          ),
        ],
      ),
      // body: Posts(),
    );
  }
}
