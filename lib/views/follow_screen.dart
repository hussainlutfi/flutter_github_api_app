import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/views/follow_button.dart';
import 'package:line_icons/line_icons.dart';

class FollowScreen extends StatelessWidget {
  const FollowScreen({super.key, required this.followList, required this.type});
  final List<User>? followList;
  final String type;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 31, 47, 140)), // Set your color here
            onPressed: () => Navigator.pop(context),
          ),
          title:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.asset(
                    "assets/images/icons8-queue-100.png",
                    width: 35,
                    color: const Color.fromARGB(255, 31, 47, 140),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 31, 47, 140),
                    ),
                  ),
                ],
              ),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 44, 44, 44),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: const Color.fromARGB(255, 240, 242, 242),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 242, 242, 242),
          ),
          child: Center(
              child: Expanded(
            
            child: ListView.builder(
              itemCount: followList!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    FollowButton(
                      follow: followList![index],
                    ),
                  ],
                );
              },
            ),
          )),
        ),
      ),
    );
  }
}
