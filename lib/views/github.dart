import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/api_screen.dart';
import 'package:github_project/views/home_screen.dart';
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
  User? user;
  bool showRepositories = true;
  bool showStarredRepos = false;
  List<Repositories>? repositoriesList;
  List<Repositories>? starredReposList;
  List<User>? followers;
  List<User>? followings;
  var isLoaded = false;
  var repoIsLoaded = false;
  var followsIsLoaded = false;

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
    followers =
    await RemoteService().getFollows(user?.followersUrl ?? "");
    String followingsLink= user?.followingUrl ?? "";
    followings =
    await RemoteService().getFollows(followingsLink.substring(0, followingsLink.length - 13));
    String starredRepos = user?.starredUrl ?? "";
    starredReposList = await RemoteService()
        .getRepositories(starredRepos.substring(0, starredRepos.length - 15));
    if (user != null && repositoriesList != null && starredReposList != null) {
      setState(() {
        isLoaded = true;
      });
    }
    else if(followers != null && followings != null){
      setState(() {
        followsIsLoaded = true;
      });
    }
  }


  var activeScreen = 'start-screen';


  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    int currentIndex =0;

    List<Widget> _widgetOptions = <Widget>[
      APIScreen(user: user, isLoaded: isLoaded, followers: followers,followings: followings,),
      RepoList(repositoriesList: repositoriesList),
      RepoList(repositoriesList: starredReposList),
    ];



    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/25231.png",
                width: 35,
                color: Color.fromARGB(255, 31, 47, 140),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "GitHub User",
                style: TextStyle(
                  color: Color.fromARGB(255, 31, 47, 140),
                ),
              ),
            ],
          ),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 44, 44, 44),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color.fromARGB(255, 240, 242, 242),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 242, 242, 242),
          ),
          child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: const Color.fromARGB(255, 31, 47, 140),
                  //Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Color.fromARGB(255, 102, 98, 217),
                  //Colors.black,
                  tabs: const [
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                    GButton(
                      icon: LineIcons.git,
                      text: 'Repositories',
                    ),
                    GButton(
                      icon: LineIcons.star,
                      text: 'Starred',
                    ),

                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange:  (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
              ),
            ),
          ),
        ),//NavBar(setScreen: setScreen,),
      ),
    );
  }
}
