import 'package:flutter/material.dart';
import 'package:app/forms/modify_profile_form.dart';

class ProfileInfos extends StatefulWidget {
  const ProfileInfos({ Key? key }) : super(key: key);

  @override
  _ProfileInfosState createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<ProfileInfos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.keyboard_arrow_left, size: 40,),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: 10, left: 20),
              child: Text("Mes informations",
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
              child: Text("Modifier ma photo de profile",
                  style: TextStyle(fontSize: 12, decoration: TextDecoration.underline, fontWeight: FontWeight.w300)),
            ),
            const SizedBox(height: 40,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const ModifyProfileForm()
            )
          ],
        ),
        
      ),
    );
  }
}