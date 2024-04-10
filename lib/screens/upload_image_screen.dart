import 'dart:typed_data';
import 'package:flutter/material.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({super.key, required this.email, required this.password, required this.username});

  final String email;
  final String password;
  final String username;

  @override
  State<AddPicture> createState() => _AddPictureState(email: email, password: password, username: username);
}

class _AddPictureState extends State<AddPicture> {
  _AddPictureState({required this.email, required this.password, required this.username});

  final String email;
  final String password;
  final String username;

  Uint8List? image = Uint8List(256 * 256);

  // these should set `image`.
  void selectImageFromGallery() { }
  void selectImageFromCamera() { }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text(
            'Holbegram',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/images/logo.webp',
            width: 80,
            height: 60,
          ),
          const SizedBox(height: 24),
          Text('Hello, $username Welcome to Holbegram'),
          const Text('Choose an image from your gallery or take a new one.'),
          Image.asset('assets/images/Sample_User_Icon.png'),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => setState(() => selectImageFromGallery()),
                icon: const Icon(Icons.image),
              ),
              IconButton(
                onPressed: () => setState(() => selectImageFromCamera()),
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(218, 226, 37, 24)),
            ),
            onPressed: () { },
            child: const Text('Next', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}