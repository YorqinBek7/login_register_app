// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace,

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_home/screens/main_page.dart';
import 'package:shared_home/storage/storage.dart';
import 'package:shared_home/widget/login_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await StorageRepository.getInstance();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                "assets/images/img.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 200),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: Container(
                              width: 22,
                              height: 18,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: SizedBox(),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Remember me",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => {
                            if (StorageRepository.getString("email") ==
                                    emailController.text &&
                                StorageRepository.getString("password") ==
                                    passwordController.text)
                              {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPage(),
                                    ))
                              }
                            else
                              {
                                Fluttertoast.showToast(
                                    msg: "Email or password wrong!!!")
                              }
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(15),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pink)),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                              child: Text(""),
                            ),
                          ),
                          Text(
                            "Or Login with",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                              child: Text(""),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          LoginButton(
                            imagePath: "assets/svg/google.svg",
                          ),
                          LoginButton(
                            imagePath: "assets/svg/apple.svg",
                          ),
                          LoginButton(
                            imagePath: "assets/svg/facebook.svg",
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      GestureDetector(
                          onTap: () => {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                )
                              },
                          child: Text(
                            " SignUp",
                            style: TextStyle(color: Colors.pink, fontSize: 16),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
