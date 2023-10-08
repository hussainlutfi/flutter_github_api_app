import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';
import 'package:github_project/services/remote_service.dart';
import 'package:github_project/views/api_screen.dart';
import 'package:github_project/views/repo_list.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainAppScreen extends StatefulWidget{
  const MainAppScreen({super.key, required this.userName});
  final String userName;

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainAppScreen();
  }

}

class _MainAppScreen extends State<MainAppScreen>{
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
    user = await RemoteService().getUser('https://api.github.com/users/${widget.userName}');

    repositoriesList =
    await RemoteService().getRepositories(user?.reposUrl ?? "" );

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

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 31, 47, 140)), // Set your color here
            onPressed: () => Navigator.pop(context),
          ),
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

//=======================================================================
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 242, 242, 242),
          ),
          child: _widgetOptions.elementAt(_selectedIndex),//Center(child: _widgetOptions.elementAt(_selectedIndex)),
        ),
//=========================================================================
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
      );
  }

}