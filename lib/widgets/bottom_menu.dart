import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              color: Colors.grey[800],
              activeColor: Colors.purple,
              iconSize: 24,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              duration: const Duration(milliseconds: 1000),
              tabs: const [
                GButton(
                  icon: LineIcons.comments,
                  text: 'Chats',
                ),
                GButton(
                  icon: LineIcons.userFriends,
                  text: 'People',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                )
              ],
              selectedIndex: index,
              onTabChange: (int index) {
                String view = '';
                switch (index) {
                  case 0:
                    view = '/chatsOverview';
                    break;
                  case 1:
                    view = '/chatsOverview';
                    break;
                  case 2:
                    view = '/chatsOverview';
                    break;
                }
                String? currentView = ModalRoute.of(context)?.settings.name;
                if (currentView != view) {
                  Navigator.popAndPushNamed(context, view);
                }
              }),
        ),
      ),
    );
  }
}
