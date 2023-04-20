import 'package:app/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app/widget_tree.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WidgetTree(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  void _changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

<<<<<<< HEAD
  List<Widget> pages = [
    const HomePage(),
=======
  static const List<Widget> pages = <Widget> [
    HomePage(),
    ProfilePage()
>>>>>>> FEAT/profile-mesInfos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: pages[currentPage],
=======
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
>>>>>>> FEAT/profile-mesInfos
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
<<<<<<< HEAD
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_rounded),
            label: 'Cuisiner',
          ),
=======
>>>>>>> FEAT/profile-mesInfos
        ],
        currentIndex: currentPage,
        selectedItemColor: Colors.amber[800],
        onTap: _changePage,
      ),
    );
  }
}
