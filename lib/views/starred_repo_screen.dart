import 'package:flutter/material.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';

class StarredRepoScreen extends StatefulWidget {
  const StarredRepoScreen({super.key});
  // final

  
  @override
  State<StatefulWidget> createState() {
    return _StarredRepoScreen();
  }
}

class _StarredRepoScreen extends State<StarredRepoScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
         Text(
            "Starred Repositories",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

}
