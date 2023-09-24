import 'package:flutter/material.dart';
import 'package:github_project/views/github.dart';
import 'package:github_project/views/main_app_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Color.fromARGB(255, 216, 216, 216)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                // color: Color.fromARGB(255, 242, 242, 242),
                ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/GitHub-Logo.png",
                      width: 250,
                      color: Color.fromARGB(255, 31, 47, 140),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Welcome to GitHub API !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: Color.fromARGB(255, 31, 47, 140),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)),),
                        labelText: 'GitHub Username',
                        hintText: 'Enter Your Username',
                      ),
                    ),
                    const SizedBox(height: 40),
                    OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MainAppScreen();
                            },
                          ),
                        );
                        },
                        style: OutlinedButton.styleFrom(
                            //padding: const EdgeInsets.only(top: 30),
                            foregroundColor: Color.fromARGB(255, 31, 47, 140),
                            textStyle: const TextStyle(fontSize: 15)),
                        icon: const Icon(Icons.arrow_right_alt),
                        label: const Text("Start GitHub API", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
