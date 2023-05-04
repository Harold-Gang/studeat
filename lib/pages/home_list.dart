import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'meal_page.dart';

class HomePagelist extends StatefulWidget {
  const HomePagelist({super.key});

  @override
  State<HomePagelist> createState() => _HomePagelistState();
}

class _HomePagelistState extends State<HomePagelist> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PlatsInformation(),
    );
  }
}

class PlatsInformation extends StatefulWidget {
  const PlatsInformation({super.key});

  @override
  State<PlatsInformation> createState() => _PlatsInformationState();
}

class _PlatsInformationState extends State<PlatsInformation> {
  final Stream<QuerySnapshot> _platsStream =
      FirebaseFirestore.instance.collection('Plats').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _platsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong",
              style: TextStyle(color: Colors.red));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MealPage()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5)),
                  ),
                  child: ListTile(
                    title: Text(
                      data['name'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto"),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    subtitle: Text(data['ingredients'],
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    leading: Image.network(
                      data['image'],
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    trailing: Text(data['price'] + '€'),
                  ),
                ));
          }).toList(),
        );
      },
    );
  }
}
