import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    User user2 = user ?? User();

    return Column(
      children: [
        ClipOval(
          child: Image.network(
            user2.avatarUrl ?? "",
            fit: BoxFit.cover,
            width: 200,
            
          ),
          
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
              user2.name??"",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Followings: ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              (user2.following).toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 25,),
            const Text(
              "Followers: ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              (user2.followers).toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // Text(user.avatarUrl)
      ],
    );
  }
}
