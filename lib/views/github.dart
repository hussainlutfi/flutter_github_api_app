import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/api_screen.dart';
import 'package:github_project/views/home_screen.dart';
import 'package:github_project/views/main_details.dart';
import 'package:github_project/views/nav_bar.dart';
import 'package:github_project/views/repo_list.dart';

class Github extends StatefulWidget {
  const Github({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Github();
  }
}

class _Github extends State<Github> {
  var activeScreen = 'start-screen';

  void ToAPIScreen() {
    setState(() {
      activeScreen = 'API_Screen';
    });
  }

  void ToStarredScreen() {
    setState(() {
      activeScreen = 'Starred_Repo_Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget; // = HomeScreen( ShowNext: ToAPIScreen,);

    if (activeScreen == "API_Screen") {
      screenWidget = const APIScreen();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/25231.png", width: 35,),
              const SizedBox(width: 10,),
              const Text("GitHub User"),
            ],
          ),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 44, 44, 44),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color.fromARGB(255, 188, 188, 188),
        ),
        body: Container(
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromARGB(255, 255, 255, 255),
            //     Color.fromARGB(255, 143, 143, 143),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: Colors.white,
          ),
          child: Center(child: const APIScreen()),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
