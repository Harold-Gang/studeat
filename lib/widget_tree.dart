import 'package:app/auth.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/cook_dish_page.dart';
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

          _children = [
            const HomePage(),
            const CookDishPage(),
            ProfilePage(),
          ];

          return _loggedIn
              ? Scaffold(
                  body: _children[_currentIndex],
                  bottomNavigationBar: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: onTabTapped,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          label: 'Accueil',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.kitchen),
                          label: 'Cuisiner',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle_outlined),
                          label: 'Compte',
                        ),
                      ],
                    ),
                  ),
                )
              : const LoginPage();
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
