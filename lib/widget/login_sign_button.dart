// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class LoginSignButton extends StatelessWidget {
  
  final Widget page;
  const LoginSignButton({super.key, required this.page});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                ))
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.all(15),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.pink)),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
}
