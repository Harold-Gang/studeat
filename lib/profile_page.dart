import 'package:flutter/material.dart';
import 'package:app/profile_infos.dart';

class ProfilePage extends StatelessWidget {
const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: 10, left: 20),
              child: Text("Compte",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Image(
                image: NetworkImage('https://picsum.photos/150')
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: 20, left: 20),
              child: Text("Tom Louveau",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 20),
              child: Text("tom.louveau@edu.devinci.fr",
                  style: TextStyle(fontSize: 15)),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Divider(thickness: 1, color: Colors.black),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileInfos())
                 );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.person_outline_rounded, size: 25,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text("Mes informations"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Icon(Icons.keyboard_arrow_right, size: 35,),
                  )
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Divider(thickness: 1, color: Colors.black),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.shopping_bag_outlined, size: 25,),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text("Mes commandes"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Icon(Icons.keyboard_arrow_right, size: 35,),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.kitchen_sharp, size: 25,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text("Mes plats"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Icon(Icons.keyboard_arrow_right, size: 35,),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Icon(Icons.favorite_border, size: 25,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Text("Favoris"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Icon(Icons.keyboard_arrow_right, size: 35,),
                )
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Divider(thickness: 1, color: Colors.black),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("A propos de"),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.keyboard_arrow_right, size: 35,),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("Mentions"),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.keyboard_arrow_right, size: 35,),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: TextButton(
                onPressed: () {},
                child: const Text('Me déconnecter', style: TextStyle(color: Colors.red),)
              ),
            )
          ]
        ),
      )
    );
  }
}