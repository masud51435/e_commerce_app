import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PbottomNavbar extends StatefulWidget {
  const PbottomNavbar({super.key});

  @override
  State<PbottomNavbar> createState() => _PbottomNavbarState();
}

class _PbottomNavbarState extends State<PbottomNavbar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _screens() {
    return [
      const HomeScreen(),
      const Center(
        child: Text('add post'),
      ),
      const Center(
        child: Text('next'),
      ),
      const Center(
        child: Text('Now again'),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: 'Home',
        activeColorPrimary: Colors.lightBlueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.store_outlined),
        title: "Store",
        activeColorPrimary: Colors.cyanAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_outline),
        title: "Wishlist",
        activeColorPrimary: CupertinoColors.activeOrange,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: "Profile",
        activeColorPrimary: CupertinoColors.systemTeal,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarItems(),
      screens: _screens(),
      navBarStyle: NavBarStyle.style9,
      navBarHeight: 55,
      backgroundColor: const Color.fromARGB(255, 58, 64, 84),
      padding: const NavBarPadding.all(10),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      bottomScreenMargin: 0,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
