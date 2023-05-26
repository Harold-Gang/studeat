import 'package:flutter/material.dart';
import 'package:app/pages/profile_infos.dart';
import 'package:app/pages/command_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    user = Auth().currentUser;
    fetchUserData();
  }

  Future<void> signOut() async {
    await Auth().signout();
  }

  Future<void> fetchUserData() async {
    if (user != null) {
      String userId = user!.uid;
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      try {
        DocumentSnapshot userSnapshot = await usersCollection.doc(userId).get();

        if (userSnapshot.exists) {
          setState(() {
            userData = userSnapshot.data() as Map<String, dynamic>?;
          });
        } else {
          print('User data not found in Firestore');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('User is not logged in');
    }
  }

  _signOutButton() {
    return TextButton(
        onPressed: signOut,
        child: const Text(
          'Me déconnecter',
          style: TextStyle(color: Colors.red),
        ));
  }

  _userId() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(user?.email ?? "User email"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Compte",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Image(image: NetworkImage('https://picsum.photos/150')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                  userData != null
                      ? userData!['firstName'] + " " + userData!['lastName']
                      : '',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            _userId(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Divider(thickness: 1, color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileInfos(),
                      settings: RouteSettings(arguments: userData)),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text("Mes informations"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Divider(thickness: 1, color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CommandePage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text("Mes commandes"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.kitchen_sharp,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text("Mes plats"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Icon(
                    Icons.favorite_border,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Text("Favoris"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35,
                  ),
                ),
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
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35,
                  ),
                ),
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
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: _signOutButton(),
            ),
          ],
        ),
      ),
    );
  }
}
