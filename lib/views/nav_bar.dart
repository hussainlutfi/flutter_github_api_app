import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget{
  const NavBar({super.key});



  @override
  Widget build(BuildContext context) {
    // int _selectedIndex = 0;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
              // GButton(
              //   icon: LineIcons.home,
              //   text: 'Home',
              // ),
              GButton(
                icon: LineIcons.star,
                text: 'Starred',
              ),
              GButton(
                icon: LineIcons.git,
                text: 'Repositories',
              ),

            ],
            // selectedIndex: _selectedIndex,
            // onTabChange: (index) {
            //   setState(() {
            //     _selectedIndex = index;
            //   });
            // },
          ),
        ),
      ),
    );
  }

}