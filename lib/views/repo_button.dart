// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:github_project/models/repositories.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoButton extends StatelessWidget {
  const RepoButton({super.key, required this.repositories});
  final Repositories repositories;

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () async {
    //     String url = repositories.htmlUrl;
    //     if (await canLaunch(url)) {
    //       await launch(url);
    //     } else {
    //       throw 'Could not launch $url';
    //     }
    //   },
    //   style: ButtonStyle(
    //     backgroundColor:
    //         MaterialStateProperty.all<Color>(Color.fromARGB(255, 46, 46, 46)),
    //     minimumSize: MaterialStateProperty.all<Size>(Size(375, 60)),
    //     foregroundColor: MaterialStateProperty.all<Color>(
    //         Color.fromARGB(255, 255, 255, 255)),
    //     shape: MaterialStateProperty.all<OutlinedBorder?>(
    //         const RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(15)))),
    //   ),
    //   child: Text(
    //     repositories.name,
    //     style: const TextStyle(
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: () async {
        String url = repositories.htmlUrl;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: 375,
        height: 60,
        // padding:  const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              
              // Color.fromARGB(255, 176, 156, 145),
              // Color.fromARGB(255, 118, 95, 83),
              // // Color.fromARGB(255, 46, 46, 46),
              // Color.fromARGB(255, 73, 73, 73),
              // Color.fromARGB(255, 73, 73, 73),
              // // Color.fromARGB(255, 46, 46, 46),
              Color.fromARGB(255, 134, 110, 97),
              Color.fromARGB(255, 169, 144, 131),
              Color.fromARGB(255, 183, 161, 149),
              Color.fromARGB(255, 176, 156, 145),
              
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Text(
            repositories.name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 41, 41, 41),
            ),
          ),
        ),
      ),
    );
  }
}
