import 'package:flutter/material.dart';
import 'package:app/pages/home_list.dart';

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
              padding: EdgeInsets.only(right: 180),
              child: Text("Demain,",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("on mange sain 🥦",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 25),
                  child: Icon(Icons.location_pin, color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text("IIM - 47 boulevard de Pesaro, Nanterre",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                )
              ],
            ),
            const SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.zero),
                    hintText: 'Recherche un plat, un ingrédient...',
                    contentPadding: EdgeInsets.symmetric(vertical: 10)),
              ),
            ),
            DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: const TabBar(
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 20),
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
                        height: MediaQuery.of(context).size.height - 350,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: const TabBarView(children: <Widget>[
                          HomePagelist(),
                          HomePagelist(),
                          HomePagelist(),
                        ]),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
