import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_project/models/User.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    User user2 = user ?? User();

    return Container(
      width: 350,
      height: 325,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 37, 37, 37),
            Color.fromARGB(255, 79, 79, 79),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              user2.avatarUrl ?? "",
              fit: BoxFit.cover,
              width: 200,
              colorBlendMode: BlendMode.softLight,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 40,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color.fromARGB(150, 179, 179, 179),
            ),
            child: Center(
              child: Text(
                user2.name ?? "",
                // textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 25,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromARGB(115, 179, 179, 179),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Followings: ",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  (user2.following).toString(),
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Followers: ",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  (user2.followers).toString(),
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
