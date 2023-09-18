// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:github_project/models/repositories.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoButton extends StatelessWidget {
  const RepoButton({super.key, required this.repositories});
  final Repositories repositories;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        String url = repositories.htmlUrl;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 72, 72, 72)),
        minimumSize: MaterialStateProperty.all<Size>(Size(375, 60)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder?>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
      child: Text(
        repositories.name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    // return FilledButton(
    //   // style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size.fromWidth(50))),
    //   onPressed: () {},
    //   child: Text(
    //     repositories.name,
    //     style: const TextStyle(
    //       fontSize: 15,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   // style: const ButtonStyle(),
    // );
  }
}
