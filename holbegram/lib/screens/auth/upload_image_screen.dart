import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'methods/user_storage.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({super.key, required this.email, required this.password, required this.username});

  final String email;
  final String password;
  final String username;

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;

  // these should set `image`.
  Future<void> selectImage(ImageSource imageSource) async {
    // print('Selecting image from $imageSource...');
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: imageSource);
    // print('Selected image: $image');
    if (image != null) {
      // print('image name: ${image.name}; image path: ${image.path}');
      Uint8List imageBytes = await image.readAsBytes();
      // print('image bytes: $imageBytes');
      setState(() {
        // print('_image: $_image');
        _image = imageBytes;
        // print('_image: $_image');
      });
    }
  }

  void selectImageFromGallery() {
    selectImage(ImageSource.gallery);
  }

  void selectImageFromCamera() {
    selectImage(ImageSource.camera);
  }

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
                    'Hello, ${widget.username} Welcome to Holbegram',
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
                (
                  _image == null
                  ? Image.asset('assets/images/Sample_User_Icon.png')
                  : Image.memory(_image!)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 40,
                      color: const Color.fromARGB(218, 226, 37, 24),
                      onPressed: selectImageFromGallery,
                      icon: const Icon(Icons.image_outlined),
                    ),
                    IconButton(
                      iconSize: 40,
                      color: const Color.fromARGB(218, 226, 37, 24),
                      onPressed: selectImageFromCamera,
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
