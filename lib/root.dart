import 'package:kuis_mobile_124240156/screens/home.dart';
import 'package:kuis_mobile_124240156/screens/profile.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  final String username;

  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      ProfileScreen(username: widget.username),
    ];

    List<String> titleScreens = ["Home", "Profile"];

    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreens[_selectedIndex]),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
