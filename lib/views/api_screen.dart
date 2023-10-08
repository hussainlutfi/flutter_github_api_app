import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/animated_repo_button.dart';
import 'package:github_project/views/follow_screen.dart';
import 'package:github_project/views/main_details.dart';
import 'package:github_project/views/repo_button.dart';
import 'package:github_project/views/repo_list.dart';
import 'package:line_icons/line_icon.dart';

class APIScreen extends StatelessWidget {
  const APIScreen(
      {super.key,
      required this.user,
      required this.isLoaded,
      required this.followers,
      required this.followings});
  final User? user;
  final bool isLoaded;
  final List<User>? followers;
  final List<User>? followings;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),

          Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MainDetails(
                  user: user,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icons8-queue-100.png",
                      width: 30,
                      color: Color.fromARGB(255, 31, 47, 140),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FollowScreen(
                                followList: followers,
                                type: "Followers",
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "${user?.followers}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 47, 140),
                            ),
                          ),
                          const Text(
                            " Followers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(150, 31, 47, 140),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 31, 47, 140)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FollowScreen(
                                followList: followings,
                                type: "Followings",
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "${user?.following}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 47, 140),
                            ),
                          ),
                          const Text(
                            " Followings",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(150, 31, 47, 140),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Container(width: 350, height: 2, color: Color.fromARGB(20, 31, 47, 140)),
                const SizedBox(height: 5,),
                const Text("Contributions" ,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                      color: Color.fromARGB(255, 31, 47, 140)),),
                Image.network(
                  "https://ssr-contributions-svg.vercel.app/_/${user?.login}?chart=calendar&format=png&weeks=15&theme=blue&widget_size=small",
                  width: 375,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
