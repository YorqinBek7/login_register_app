import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String sharedText;
  const CustomTextField(
      {super.key, required this.text, required this.sharedText});

  @override
  Widget build(BuildContext context) => Container(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: text,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
}
