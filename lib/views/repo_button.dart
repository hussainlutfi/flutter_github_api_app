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
      onTap:  () async {
        Uri _url = Uri.parse(repositories.htmlUrl);
        if (!await launchUrl(_url)) {
          throw Exception('Could not launch $_url');
        }
      },

      child: Container(
          width: 375,
          height: 100,
          // padding:  const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                offset: const Offset(
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
                      SizedBox(
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
              // SizedBox(height: 15,),
              // Align(
              //   alignment: AlignmentDirectional.bottomEnd,
              //   child: Container(
              //     margin: EdgeInsets.only(right: 15),
              //     child: ElevatedButton(
              //       onPressed: () async {
              //         String url = repositories.htmlUrl;
              //         if (await canLaunch(url)) {
              //           await launch(url);
              //         } else {
              //           throw 'Could not launch $url';
              //         }
              //       },
              //       style: ButtonStyle(
              //         backgroundColor:
              //         MaterialStateProperty.all<Color>(Color.fromARGB(255, 31, 47, 140)),
              //         minimumSize: MaterialStateProperty.all<Size>(Size(80, 40)),
              //         foregroundColor: MaterialStateProperty.all<Color>(
              //             Color.fromARGB(255, 255, 255, 255)),
              //         shape: MaterialStateProperty.all<OutlinedBorder?>(
              //             const RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(8)))),
              //       ),
              //       child: Text(
              //         "view",
              //         style: const TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          )),
    );
  }
}
