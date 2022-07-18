import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_home/screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      (() => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            )
          }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/img.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 50,
            top: 250,
            child: Image.asset(
              "assets/images/title.png",
              width: 280,
              height: 280,
            ),
          )
        ]),
      );
}
