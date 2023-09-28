import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.setScreen});
  final Function(int index) setScreen;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int _selectedIndex = 0;
    void SetSelected(int index){
      _selectedIndex = index;
    }
    return Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: const Color.fromARGB(255, 102, 98, 217),
            tabs: const [
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
              GButton(
                icon: LineIcons.star,
                text: 'Starred',
              ),
              GButton(
                icon: LineIcons.git,
                text: 'Repositories',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange:  (index) {
              setScreen(index);
            }
          ),
        ),
      ),
    );
  }

}