import 'package:flutter/material.dart';
import 'package:app/pages/order_page.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<String> ingredients = [
    "Carottes",
    "Pommes de terre",
    "Viande",
    "Fromage",
    "Légumes",
    "Oeufs",
    "Lait",
    "Tomates",
    "Concombres",
    "Avocats",
  ];

  void _goToOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrderPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Image.network(
                    'https://picsum.photos/500',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Pour demain',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                      ),
                    ),
                  ),
                ]),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.topLeft,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Hachis Parmentier',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('🐛 Aux insectes',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 250),
            child: SizedBox(
              width: 20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: _goToOrder,
                  child: const Text("Je réserve")),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text('Ce plat sera remis en main propre le 3 avril à : ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
                Text('IIM',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Ingrédients :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Column(
                children: ingredients.map((ingr) {
              return Row(children: [
                Text(
                  "\u2022",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    ingr,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]);
            }).toList()),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Padding(
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
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Commentaires :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(children: [
                Text(
                  "\u2022",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Ceci est un commentaire",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ])),
        ],
      ),
    );
  }
}
