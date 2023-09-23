import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_project/models/User.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key, required this.follow});
  final User follow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri _url = Uri.parse(follow.htmlUrl!);
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
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            follow.avatarUrl ?? "",
                            fit: BoxFit.cover,
                            width: 75,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          follow.login??"",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 31, 47, 140),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
