import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ModifyProfileForm extends StatefulWidget {
  const ModifyProfileForm({ Key? key }) : super(key: key);

  @override
  _ModifyProfileFormState createState() => _ModifyProfileFormState();
}

class _ModifyProfileFormState extends State<ModifyProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: TextFormField(
              decoration: 
                const InputDecoration(
                  labelText: 'Prénom',
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir votre prénom';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: TextFormField(
              decoration: 
                const InputDecoration(
                  labelText: 'Nom',
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir votre Nom';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: TextFormField(
              decoration: 
                const InputDecoration(
                  labelText: 'Classe',
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir votre classe';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: TextFormField(
              decoration: 
                const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir votre adresse email';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Veuillez saisir une adresse email valide';
                }
                return null;
              },
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(
                  top: 20),
              child: Text("Modifier mon mot de passe",
                  style: TextStyle(fontSize: 12, decoration: TextDecoration.underline, fontWeight: FontWeight.w300)),
            ),
          const SizedBox(height: 40),
          Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 16, 16),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  //   _formKey.currentState.save();
                      
                  //   final updatedUser = widget.user.copyWith(
                  //     firstName: _firstName,
                  //     lastName: _lastName,
                  //     classe: _classe,
                  //     email: _email,
                  //   );
                      
                    // Save the updated user information
                    // ...
                  // }
                },
                child: const Text('Enregistrer', style: TextStyle(fontSize: 20),),
              ),
          ),
        ],
      ),
    );
  }
}