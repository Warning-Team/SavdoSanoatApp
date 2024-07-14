import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/views/screens/home_page.dart';
import 'package:savdosanoatapp/views/screens/profile_screen.dart';

class ManegerPage extends StatefulWidget {
  final User user;

  ManegerPage({super.key, required this.user});

  @override
  State<ManegerPage> createState() => _ManegerPageState();
}

class _ManegerPageState extends State<ManegerPage> {
  late List<Widget> screens;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomePage(),
      const ProfileScreen(),
    ];
    final userController = context.read<UserController>();
    userController.user = widget.user;
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
