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
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 180), //apply padding to some sides only
                child: Text("Demain,", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10), //apply padding to some sides only
                child: Text("on mange sain 🥦", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 25), //apply padding to some sides only
                    child: Icon(Icons.location_pin, color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text("IIM - 47 boulevard de Pesaro, Nanterre", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  )
                ],
              ),
              const SizedBox(
                width: 320,
                child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                    borderRadius: BorderRadius.zero
                  ),
                  hintText: 'Recherche un plat, un ingrédient...',
                  contentPadding: EdgeInsets.symmetric(vertical: 10)
                ),
              ),
              ),
              DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  Container(
                    child: const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(text: 'Demain'),
                        Tab(text: 'Après-demain'),
                        Tab(text: 'Plus tard')
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                  Container(
                    child: const Center(
                      child: Text('Demain', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    child: const Center(
                      child: Text('Après-demain', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    child: const Center(
                      child: Text('Plus tard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ]),
                ),
                ])
              )
            ],
          ),
      ),
    );
  }
}