import 'package:app/auth.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  late Stream<bool> _loggedInStream;
  bool _loggedIn = false;

  int _currentIndex = 0;

  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _loggedInStream = Auth().authStateChanges.map((user) => user != null);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _loggedInStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          _loggedIn = snapshot.data ?? false;

          _children = _loggedIn
              ? [
                  HomePage(),
                  ProfilePage(),
                ]
              : const [
                  HomePage(),
                  LoginPage(),
                ];

          return _loggedIn
              ? Scaffold(
                  body: _children[_currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: _currentIndex,
                    onTap: onTabTapped,
                    items: _loggedIn
                        ? const [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.supervised_user_circle),
                              label: 'Profile',
                            ),
                          ]
                        : const [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.login),
                              label: 'Login',
                            ),
                          ],
                  ),
                )
              : LoginPage();
        }
      },
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
