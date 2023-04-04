import 'package:flutter/material.dart';

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
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 0.5,
    ))),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://picsum.photos/200',
            fit: BoxFit.fill,
            width: 100.0,
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11.0, 0.0, 9.0, 0.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Hachis Parmentier",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "🥘 Omnivore",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          "- cuisiné par Emma M.",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ],
                  ),
                  Text("Viande hachée, purée de pomme de terre, oignons, lait",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w100,
                          fontFamily: "Roboto"))
                ]),
          )
        ]),
  );
}
