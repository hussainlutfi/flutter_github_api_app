// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:github_project/models/repositories.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoButton extends StatelessWidget {
  const RepoButton({super.key, required this.repositories});
  final Repositories repositories;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        Uri _url = Uri.parse(repositories.htmlUrl);
        if (!await launchUrl(_url)) {
          throw Exception('Could not launch $_url');
        }
      },
      child: Container(
        width: 375,
        height: 100,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repositories.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 31, 47, 140),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "language: ${repositories.language ?? "Unspecified"}",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
