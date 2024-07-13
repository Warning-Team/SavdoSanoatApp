import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/views/screens/home_page.dart';
import 'package:savdosanoatapp/views/screens/profile_screen.dart';

// ignore: must_be_immutable
class ManegerPage extends StatefulWidget {
  User user;
  ManegerPage({super.key, required this.user});

  @override
  State<ManegerPage> createState() => _ManegerPageState();
}

class _ManegerPageState extends State<ManegerPage> {
  List<Widget> screens = <Widget>[
    const HomePage(),
    const ProfileScreen(),
  ];
  int curentindex = 0;
  @override
  Widget build(BuildContext context) {
    final usercontroller = context.read<UserController>();
    usercontroller.user = widget.user;
    return Scaffold(
      body: screens[curentindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          curentindex = value;
          setState(() {});
        },
        currentIndex: curentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          )
        ],
      ),
    );
  }
}
