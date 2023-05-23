import 'package:flutter/material.dart';
import 'package:app/pages/order_page.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  bool isToggled = false;
  bool? isChecked = false;
  List<String> ingredients = [];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // push to ingredients list the ingredients from the database
    // convert string to array, separate by comma, remove the space
    ingredients = data['ingredients'].split(', ');
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Image.network(
                    data['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
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
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(data['name'],
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          const Padding(
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
                    backgroundColor: isToggled ? Colors.blue : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderPage(),
                      settings: RouteSettings(arguments: data)),
                    );
                  },
                  child: const Text("Je réserve")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: const [
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
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Ingrédients :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
                children: ingredients.map((ingr) {
              return Row(children: [
                const Text(
                  "\u2022",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    ingr,
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ]);
            }).toList()),
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
                        children: const <Widget> [
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
              child: Row(children: const [
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
