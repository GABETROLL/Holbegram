import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  const AddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Image', style: TextStyle(fontSize: 50)),
        actions: <Widget>[
          TextButton(
            child: const Text('Post', style: TextStyle(fontSize: 50, fontFamily: 'Billabong')),
            onPressed: () { },
          ),
        ],
      ),
      // body: 
    );
  }
}
