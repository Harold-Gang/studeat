import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const RootPage(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudEat'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Action');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
        NavigationDestination(icon: Icon(Icons.newspaper), label: 'News'),
        NavigationDestination(icon: Icon(Icons.book), label: 'Recipe'),
        NavigationDestination(icon: Icon(Icons.cookie), label: 'Meal'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),

        ],),
    );
  }
}
