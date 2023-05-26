import 'package:app/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;

    final Map<String, dynamic> plat =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    void order() {
      FirebaseFirestore.instance
          .collection('orders')
          .add({'user_id': user!.uid, 'plat_id': plat['uid']});

      _goBack();
    }

    return Scaffold(
      body: ListView(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Récapitulatif',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(plat["name"],
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Végétarien',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  decoration: TextDecoration.none)),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: const [
              Text('A récupérer ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
              Text('lundi 23/10/2023 ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
              Text('à cet endroit :',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(plat["place"],
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Ce plat est cuisiné par :',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 75,
                    height: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://picsum.photos/200',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Jordan C.",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        Text(
                          "jordan.c@edu.devinci.fr",
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        )
                      ]),
                )
              ]),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Commentaires :',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(children: [
              const Text(
                "\u2022",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  plat["commentaire"] ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ])),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SizedBox(
            width: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: order,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Valider la commande",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
        ),
      ]),
    );
  }
}
