import 'package:flutter/material.dart';
import 'package:app/pages/meal_page.dart';

class HomePagelist extends StatefulWidget {
  const HomePagelist({super.key});

  @override
  State<HomePagelist> createState() => _HomePagelistState();
}

class _HomePagelistState extends State<HomePagelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(itemCount: 10, itemBuilder: itemBuilder))
        ],
      ),
    );
  }
}

// create itemBuilder function
Widget itemBuilder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MealPage()));
    },
    child: Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(children: [
              Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.fill,
                width: 100.0,
                height: 100.0,
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    print("Liked");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.topRight,
              )
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(11.0, 0.0, 9.0, 0.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Hachis Parmentier",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "🥘 Omnivore",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "- cuisiné par",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Redirect to profile page");
                            },
                            child: Text(
                              " Emma M.",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                        "Viande hachée, purée de pomme de terre, oignons, lait",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w100,
                            fontFamily: "Roboto"))
                  ]),
            )
          ]),
    ),
  );
}
