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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Hello, $username Welcome to Holbegram',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Choose an image from your gallery or take a new one.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: 200,
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/Sample_User_Icon.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 40,
                      color: const Color.fromARGB(218, 226, 37, 24),
                      onPressed: () => setState(() => selectImageFromGallery()),
                      icon: const Icon(Icons.image_outlined),
                    ),
                    IconButton(
                      iconSize: 40,
                      color: const Color.fromARGB(218, 226, 37, 24),
                      onPressed: () => setState(() => selectImageFromCamera()),
                      icon: const Icon(Icons.camera_alt_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(218, 226, 37, 24)),
                    ),
                    onPressed: () { },
                    child: const Text(
                      'Next', style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
