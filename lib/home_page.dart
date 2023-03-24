import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 150), //apply padding to some sides only
                child: Text("Demain,", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20), //apply padding to some sides only
                child: Text("on mange sain 🥦", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}