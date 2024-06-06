import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final int maxLines;

  const MyTextField({super.key,
  required this.controller, required this.hintText, required this.obscureText,
  required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              cursorColor: Colors.grey,
              style: TextStyle(
                color: Colors.brown
              ),
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)
                ),
                hintText: hintText,
                hintMaxLines: maxLines
              ),
            ),
            );
  }
}