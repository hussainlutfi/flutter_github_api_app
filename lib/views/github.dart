import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/api_screen.dart';
import 'package:github_project/views/home_screen.dart';
import 'package:github_project/views/main_app_screen.dart';
import 'package:github_project/views/main_details.dart';
import 'package:github_project/views/nav_bar.dart';
import 'package:github_project/views/repo_list.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Github extends StatefulWidget {
  const Github({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Github();
  }
}

class _Github extends State<Github> {
  @override
  Widget build(BuildContext context) {
    int currentIndex =0;

    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
