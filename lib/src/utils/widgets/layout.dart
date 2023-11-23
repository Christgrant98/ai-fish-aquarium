import 'package:flutter/material.dart';

import 'package:login_flutter/src/utils/widgets/botton_navigator_menu.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool hasBottomNavigationBar;
  const Layout({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.hasBottomNavigationBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(child: body),
          bottomNavigationBar:
              hasBottomNavigationBar ? const BottomNavigatorMenu() : null,
        );
      },
    );
  }
}
