// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_home/screens/login_page.dart';
import 'package:shared_home/storage/storage.dart';
import 'package:shared_home/widget/login_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String password = "";
  String confirmPassword = "";
  String email = "";
  String userName = "";
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await StorageRepository.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/img.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 120),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "SignUp",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User name",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onChanged: (value) => {
                      userName = value,
                      StorageRepository.putString(
                          key: "user_name", value: value)
                    },
                    decoration: InputDecoration(
                      hintText: "User name",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onChanged: (value) => {
                      email = value,
                      StorageRepository.putString(key: "email", value: value)
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onChanged: (value) => {
                      password = value,
                      StorageRepository.putString(key: "password", value: value)
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Confirm password",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onChanged: (value) => {confirmPassword = value},
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Confirm password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => {
                        if (password == confirmPassword)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ))
                          }
                        else if (password != confirmPassword)
                          {
                            Fluttertoast.showToast(
                                msg: "Confirm password is wrong!!!")
                          }
                        else if (password == "" ||
                            confirmPassword == "" ||
                            email == "" ||
                            userName == "")
                          {Fluttertoast.showToast(msg: "Fields must be filled")}
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(15),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                        "Or SignUp with",
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
                    children: [
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
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                      onTap: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            )
                          },
                      child: Text(
                        " Login",
                        style: TextStyle(color: Colors.pink, fontSize: 16),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
