import 'package:app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'home_page.dart';

class CookDishPage extends StatefulWidget {
  const CookDishPage({Key? key}) : super(key: key);

  @override
  _CookDishPageState createState() => _CookDishPageState();
}

class _CookDishPageState extends State<CookDishPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  // Controllers
  final dishNameController = TextEditingController();
  final ingredientsController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  String selectedPortion = 'Nombre de portion(s)';
  final commentaireController = TextEditingController();

  List<String> portions = [
    'Nombre de portion(s)',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    final dishNameField = TextFormField(
      controller: dishNameController,
      autofocus: false,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelText: "Nom du plat cuisiné*",
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      onSaved: (value) {
        dishNameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Remplissez le champ Nom du plat");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final ingredientsField = TextFormField(
      controller: ingredientsController,
      autofocus: false,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelText: "Liste des ingrédients*",
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      onSaved: (value) {
        ingredientsController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Remplissez le champ liste des ingrédients");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final placeField = TextFormField(
      controller: placeController,
      autofocus: false,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelText: "Lieu de rendez-vous*",
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      onSaved: (value) {
        placeController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Remplissez le champ Lieu de rendez-vous");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final dateField = TextFormField(
      controller: dateController,
      autofocus: false,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelText: "Heure de rendez-vous*",
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      onTap: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onConfirm: (date) {
            setState(() {
              _selectedDate = date;
              dateController.text = DateFormat('yyyy-MM-dd HH:mm').format(date);
            });
          },
          currentTime: DateTime.now(),
          locale: LocaleType.fr, // Specify your language preference here
        );
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final portionsField = DropdownButtonFormField(
      value: selectedPortion,
      onChanged: (String? value) {
        setState(() {
          selectedPortion = value!;
        });
      },
      items: portions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelText: "",
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );

    final commentaireField = TextFormField(
      controller: commentaireController,
      autofocus: false,
      maxLines: 2,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelText: "Commentaire",
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      onSaved: (value) {
        commentaireController.text = value!;
      },
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
    );

    final submitDish = ElevatedButton(
      onPressed: () {
        FirebaseFirestore.instance.collection('Plats').add({
          'name': dishNameController.value.text,
          'ingredients': ingredientsController.value.text,
          'place': placeController.value.text,
          'date': dateController.value.text,
          'portions': selectedPortion,
          'commentaire': commentaireController.value.text,
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp())
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, fixedSize: const Size(400, 40)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Text('Enregistrer le plat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );

    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: <Widget>[
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70, left: 30, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Je cuisine un plat",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 35)),
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        "images/login_image.png",
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 30,
                        left: 170,
                        child: Image.asset(
                          'images/profile_image.png',
                          width: MediaQuery.of(context).size.width * 0.22,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Align(
                                child: Text(
                                  "* champ obligatoire",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                alignment: Alignment.centerLeft),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: dishNameField),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: ingredientsField),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: placeField),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: dateField),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: portionsField),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: commentaireField),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: submitDish),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        // if(isLoading)
        //   const Opacity(
        //     opacity: 0.8,
        //     child: ModalBarrier(dismissible: false, color: Colors.black),
        //   ),
        // if(isLoading)
        //   const Center(
        //     child: CircularProgressIndicator(),
        //   ),
      ],
    );
  }
}
