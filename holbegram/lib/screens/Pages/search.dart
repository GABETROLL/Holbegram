import 'package:flutter/material.dart';
import 'package:holbegram/widgets/text_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextFieldInput(
            controller: searchController,
            isPassword: false,
            hintText: 'Search',
            keyboardType: TextInputType.text,
            filled: true
          ),
          
        ],
      ),
    );
  }
}
