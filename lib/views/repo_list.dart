import 'package:flutter/material.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/views/repo_button.dart';

class RepoList extends StatelessWidget {
  const RepoList({super.key, required this.repositoriesList});
  final List<Repositories>? repositoriesList;

  @override
  Widget build(BuildContext context) {
    if (repositoriesList!.isNotEmpty) {
      return Expanded(

        // child: ListView(children: repositoriesList!.map((repository) {
        //   return RepoButton(repositories: repository);
        // }).toList()),
        child: ListView.builder(
          itemCount: repositoriesList!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 20,),
                RepoButton(
                  repositories:repositoriesList![index] ,
                ),
              ],
            );
          },
        ),
      );
    }
    else {
      return const Text("There is no Repos");
    }
  }
}
