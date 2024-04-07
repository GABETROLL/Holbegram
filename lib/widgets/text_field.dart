import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({super.key, required this.controller, required this.isPassword, required this.hintText, this.suffixIcon, required this.keyboardType});

  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    const invisibleBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        style: BorderStyle.none
      ),
    );

    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: const Color.fromARGB(218, 226, 37, 24),
      decoration: InputDecoration(
        hintText: hintText,
        border: invisibleBorder,
        enabledBorder: invisibleBorder,
        focusedBorder: invisibleBorder,
        // fillColor: const Color.fromARGB(0xFF, 0x80, 0x80, 0x80),
        filled: true,
        suffixIcon: suffixIcon, // maybe null, but it'll just not show any suffixIcon if it is null.
        contentPadding: const EdgeInsets.all(8),
      ),
      textInputAction: TextInputAction.next,
      obscureText: isPassword,
    );
  }
}
