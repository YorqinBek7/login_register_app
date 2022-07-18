import 'package:flutter/material.dart';
import 'package:shared_home/data/fake_data.dart';
import 'package:shared_home/data/getfake.dart';
import 'package:shared_home/screens/login_page.dart';
import 'package:shared_home/storage/storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Fake> list = FakeData.getFakeData();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.grid_goldenratio_sharp,
            color: Colors.pink,
          ),
          backgroundColor: Colors.grey.shade900,
          title: const Text(
            "Javanica",
            style: TextStyle(color: Colors.pink),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10))),
                onPressed: () => {
                  StorageRepository.putString(key: "email", value: ""),
                  StorageRepository.putString(key: "user_name", value: ""),
                  StorageRepository.putString(key: "password", value: ""),
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ))
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/img.png",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                padding: EdgeInsets.all(30),
                child: const Center(
                  child: Text(
                    "NEW HOUSES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
                    child: Image.asset(
                      list[index].imagePath,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]));
}
