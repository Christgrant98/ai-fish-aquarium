import 'package:flutter/material.dart';
import 'package:login_flutter/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../utils/widgets/botton_navigator_menu.dart';

class MyBottonNavBar extends StatelessWidget {
  final Function(int) onTapFunc;
  final int selectedIndex;

  const MyBottonNavBar(
      {super.key, required this.onTapFunc, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTapFunc,
      currentIndex: selectedIndex,
      backgroundColor: Colors.blueAccent,
      unselectedItemColor: const Color.fromARGB(146, 255, 255, 255),
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_outlined),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            activeIcon: Icon(Icons.camera_outlined),
            label: "Camara"),
        BottomNavigationBarItem(
            icon: Icon(Icons.map),
            activeIcon: Icon(Icons.map_outlined),
            label: "Mapa"),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user!;
    return AppBar(
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: Colors.transparent,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      drawer: const MyDrawer(),
      body: child,

      bottomNavigationBar: BottomNavigatorMenu(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         activeIcon: Icon(Icons.home_outlined),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.camera),
      //         activeIcon: Icon(Icons.camera_outlined),
      //         label: "Camara"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.map),
      //         activeIcon: Icon(Icons.map_outlined),
      //         label: "Mapa"),
      //   ],
      //   currentIndex: _calculateSelectedIndex(context),
      //   onTap: (int idx) => _onItemTapped(idx, context),
      // ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(user.profilePicture),
                ),
                const SizedBox(height: 10),
                Text(
                  user.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Acerca de la Aplicación para Acuarios'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido a la Aplicación para Acuarios',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Esta aplicación está diseñada para los amantes de los acuarios, ya sean principiantes o expertos en acuarismo. Aquí encontrarás herramientas útiles, información sobre peces, consejos de cuidado y mucho más.',
                ),
                SizedBox(height: 10),
                Text(
                  '¡Explora el mundo fascinante de los acuarios y crea un entorno acuático vibrante para tus peces!',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
