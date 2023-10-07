import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/github.dart';
import 'package:github_project/views/main_app_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  final usernameController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController.addListener(() => setState(() { }));
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color:Color.fromARGB(250,250,250,255),
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
                              fontSize: 30,
                              color: Color.fromARGB(255, 31, 47, 140),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              labelText: 'GitHub Username',
                              hintText: 'Username',
                              suffixIcon: usernameController.text.isEmpty
                                  ? Container(width: 0)
                                  : IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () =>
                                          usernameController.clear(),
                                    ),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(height: 40),
                        OutlinedButton.icon(
                            onPressed: ()  {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MainAppScreen(
                                  userName: usernameController.text,
                                );
                              },
                            ),
                          );
                            },

                            style: OutlinedButton.styleFrom(
                                //padding: const EdgeInsets.only(top: 30),
                                foregroundColor:
                                    const Color.fromARGB(255, 31, 47, 140),
                                textStyle: const TextStyle(fontSize: 15)),
                            icon: const Icon(Icons.arrow_right_alt),
                            label: const Text(
                              "Start GitHub API",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
