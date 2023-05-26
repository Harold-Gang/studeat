import 'package:app/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/forms/modify_profile_form.dart';

class CommandePage extends StatefulWidget {
  const CommandePage({Key? key}) : super(key: key);

  @override
  _ProfileInfosState createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<CommandePage> {
  @override
  void initState() {
    super.initState();
  }

  final Stream<QuerySnapshot> _orderStream =
      FirebaseFirestore.instance.collection('orders').snapshots();

  final User? user = Auth().currentUser;

  Map<String, dynamic>? dishData;

  Future<List<Map<String, dynamic>>> fetchUserOrders(String userId) async {
    List<Map<String, dynamic>> orders = [];
    List<Map<String, dynamic>> userOrders = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('user_id', isEqualTo: user!.uid)
          .get();

      orders = querySnapshot.docs
          .map((document) => document.data() as Map<String, dynamic>)
          .toList();

      for (var order in orders) {
        QuerySnapshot orderSnapshot = await FirebaseFirestore.instance
            .collection('Plats')
            .where('uid', isEqualTo: order['plat_id'])
            .get();

        List<Map<String, dynamic>> dishDataList = orderSnapshot.docs
            .map((document) => document.data() as Map<String, dynamic>)
            .toList();
        userOrders.addAll(dishDataList);
      }
    } catch (e) {
      print('Error fetching user dishes: $e');
    }

    return userOrders;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchUserOrders(user!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text("Erreur : ${snapshot.error}");
        }

        final allOrders = snapshot.data;

        if (allOrders == null || allOrders.isEmpty) {
          return Text("Aucune commande à afficher.");
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text("Mes commandes",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allOrders.length,
                    itemBuilder: (context, index) {
                      final data = allOrders[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 20),
                            child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data['image']))),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  data['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5.0, right: 10.0),
                                    child: Text(
                                      data['date'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          backgroundColor: Colors.brown[50]),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "ionsex",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
