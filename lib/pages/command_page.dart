import 'package:flutter/material.dart';
import 'package:app/forms/modify_profile_form.dart';

class CommandePage extends StatefulWidget {
  const CommandePage({Key? key}) : super(key: key);

  @override
  _ProfileInfosState createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<CommandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
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
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text("Mes commandes",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child:
                      Image(image: NetworkImage('https://picsum.photos/150')),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Hachis parmentier au saumon",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, right: 10.0),
                          child: Text(
                            "Demain",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12, backgroundColor: Colors.brown[50]),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "Végétarien",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth:
                              200, // Set the maximum width of the container
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Pâtes, saumon, crème fraîche, sel, poivre",
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 30.0, left: 10.0),
                  child: Text(
                    "Pour plus tard :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Hachis parmentier au saumon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Merc. 3 Mars"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Végétarien"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Hachis parmentier au saumon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Merc. 3 Mars"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Végétarien"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 30.0, left: 10.0),
                  child: Text(
                    "Commandes passées :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Hachis parmentier au saumon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Merc. 3 Mars"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Végétarien"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Hachis parmentier au saumon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Merc. 3 Mars"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Végétarien"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Hachis parmentier au saumon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Merc. 3 Mars"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Végétarien"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Hachis parmentier au saumon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Merc. 3 Mars"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Végétarien"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
