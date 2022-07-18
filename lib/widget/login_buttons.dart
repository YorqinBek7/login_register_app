// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends StatelessWidget {
  final String imagePath;
  const LoginButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    imagePath,
    width: 70,
    height: 70,
  );
}
