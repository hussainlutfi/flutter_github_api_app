import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/animated_repo_button.dart';
import 'package:github_project/views/main_details.dart';
import 'package:github_project/views/repo_button.dart';
import 'package:github_project/views/repo_list.dart';

class APIScreen extends StatefulWidget {
  const APIScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _APIScreen();
  }
}

class _APIScreen extends State<APIScreen> {
  User? user;
  bool showRepositories = true;
  bool showStarredRepos = false;
  List<Repositories>? repositoriesList;
  List<Repositories>? starredReposList;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    user = await RemoteService().getUser();
    repositoriesList =
        await RemoteService().getRepositories(user?.reposUrl ?? "");
    String starredRepos = user?.starredUrl ?? "";
    starredReposList = await RemoteService()
        .getRepositories(starredRepos.substring(0, starredRepos.length - 15));
    if (user != null && repositoriesList != null && starredReposList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void toStarred() {
    setState(() {
      showRepositories = false;
      showStarredRepos = true;
    });
  }

  void toRepositories() {
    setState(() {
      showRepositories = true;
      showStarredRepos = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            MainDetails(
              user: user,
            ),
            
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(
            //           Color.fromARGB(255, 39, 39, 39))),
            //   child: const Text(
            //     "Starred Repos",
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            AnimatedRepoButton(
                toStarred: toStarred, toRepositories: toRepositories),
            // ElevatedButton(
            //   onPressed: () {
            //   },
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all<Color>(
            //         Color.fromARGB(255, 39, 39, 39)),
            //     minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
            //   ),
            //   child: const Text(
            //     "Starred Repos",
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 20,),

            // ElevatedButton(
            //   onPressed: () {
            //   },
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all<Color>(
            //         Color.fromARGB(255, 39, 39, 39)),
            //     minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
            //   ),
            //   child: const Text(
            //     "Repositories",
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            // const Text(
            //   "Repositories:",
            //   style: TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            // RepoList(repositoriesList: repositoriesList)
            Visibility(
              visible: isLoaded && showRepositories,
              child: RepoList(repositoriesList: repositoriesList),
            ),
            Visibility(
              visible: isLoaded && showStarredRepos,
              child: RepoList(repositoriesList: starredReposList),
            )
          ],
        ),
      ),
    );
  }
}
