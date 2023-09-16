import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key, required this.ShowNext});
  final void Function() ShowNext;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        // Image.asset("assets/images/GitHub-Logo.png"),
        const SizedBox(height: 40),
          const Text(
            'Welcome to GitHub API !',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
              onPressed: ShowNext,
              style: OutlinedButton.styleFrom(
                  //padding: const EdgeInsets.only(top: 30),
                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                  textStyle: const TextStyle(fontSize: 15)),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start GitHub API")),
      ]),
    );
  }

}