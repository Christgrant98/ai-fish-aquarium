import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigatorMenu extends StatefulWidget {
  const BottomNavigatorMenu({
    super.key,
  });

  @override
  State<BottomNavigatorMenu> createState() => BottomNavigatorMenuState();
}

class BottomNavigatorMenuState extends State<BottomNavigatorMenu> {
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      blur: 25,
      color: const Color.fromRGBO(0, 0, 0, 0.6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: GNav(
          backgroundColor: Colors.transparent,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: _calculateSelectedIndex(context),
          color: const Color.fromARGB(255, 153, 153, 153),
          activeColor: const Color.fromARGB(255, 33, 243, 236),
          padding: const EdgeInsets.all(5),
          gap: 8,
          onTabChange: (index) {
            if (!_isDisposed) {
              _onItemTapped(index, context);
            }
          },
          tabs: const [
            GButton(
              iconSize: 30,
              icon: CupertinoIcons.house_fill,
            ),
            GButton(
              iconSize: 50.5,
              icon: CupertinoIcons.camera_fill,
            ),
            GButton(
              iconSize: 30,
              icon: CupertinoIcons.map_fill,
            ),
          ],
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home_view')) {
      return 0;
    }
    if (location.startsWith('/camera_view')) {
      return 1;
    }
    if (location.startsWith('/map_view')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home_view');
        break;
      case 1:
        GoRouter.of(context).go('/camera_view');
        break;
      case 2:
        GoRouter.of(context).go('/map_view');
        break;
    }
  }
}
