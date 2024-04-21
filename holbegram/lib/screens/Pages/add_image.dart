import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:holbegram/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:holbegram/screens/home.dart';
// firebase stuff
import 'package:holbegram/models/user.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/screens/Pages/methods/post_storage.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final TextEditingController _captionController = TextEditingController();
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

  Future<String> uploadPost() async {
    if (_image == null) return 'No image to upload';

    Users? user = await AuthMethods().getUserDetails();

    if (user == null) return "You're not logged in!";

    return await PostStorage().uploadPost(_captionController.text, user.uid, user.username, user.photoUrl, _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Image', style: TextStyle(fontSize: 50)),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) => TextButton(
              onPressed: () {
                uploadPost().then(
                  (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(value)),
                    );

                    // TODO: NAVIGATE TO HOME WITHOUT PUSHING ON TOP
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Home(),
                      ),
                    ); */
                  },
                  onError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Unexpected error: $error')),
                    );
                  }
                );
              },
              child: const Text(
                'Post',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Billabong',
                  color: Color.fromARGB(218, 226, 37, 24),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Text('Add Image'),
          const Text('Choose an image from your gallery or take one.'),
          TextFieldInput(
            controller: _captionController,
            isPassword: false,
            hintText: 'Write a caption...',
            keyboardType: TextInputType.text
          ),
          const SizedBox(height: 100),
          (
            _image != null
            ? Image.memory(_image!)
            : Image.asset('assets/images/add_image_icon.webp')
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
        ]
      )
    );
  }
}
