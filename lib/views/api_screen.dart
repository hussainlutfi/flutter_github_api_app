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
              height: 20,
            ),
            MainDetails(
              user: user,
            ),
            AnimatedRepoButton(
                toStarred: toStarred, toRepositories: toRepositories),
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
