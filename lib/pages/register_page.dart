import 'package:app/models/user_model.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;
  String? errorMessage = '';

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final classeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  void createUserWithEmailAndPassword() async {
    if(_formKey.currentState!.validate()) {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      ).then((value) => {
        postDetailsToFirestore()
      }).catchError((e) => {
        Fluttertoast.showToast(msg: e!.message)
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = Auth().currentUser;

    //calling our user model

    UserModel userModel = UserModel();

    //sending user data

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.age = ageController.text;
    userModel.classe = classeController.text;

    firebaseFirestore.collection("users").doc(userModel.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");

    //redirection

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);

  }

  @override
  Widget build(BuildContext context) {

    final firstNameField = TextFormField(
      controller: firstNameController,
      autofocus: false,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        labelText: "Prénom",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        )
      ),
      onSaved: (value) {
        firstNameController.text = value!;
      },
      validator: (value) {
        if(value!.isEmpty) {
          return ("Remplissez le champ Prénom");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final lastNameField = TextFormField(
      controller: lastNameController,
      autofocus: false,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        labelText: "Nom",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        )
      ),
      onSaved: (value) {
        lastNameController.text = value!;
      },
      validator: (value) {
        if(value!.isEmpty) {
          return ("Remplissez le champ Nom");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final emailField = TextFormField(
      controller: emailController,
      autofocus: false,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        labelText: "Email",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        )
      ),
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) {
        if(value!.isEmpty) {
          return ("Remplissez le champ Email");
        }
        if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
          return ("Veuillez entrer une adresse email valide");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
    );

    final passwordField = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: passwordVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        labelText: "Mot de passe",
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility)
        )
      ),
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{8,}$');
        if(value!.isEmpty) {
          return ("Remplissez le champ Mot de passe");
        }
        if(!regex.hasMatch(value)) {
          return ("Veuillez entrer un mot de passe valide (8 chara. mini)");
        }
        
        return null;
      },
      textInputAction: TextInputAction.next,
    );

    final confirmPasswordField = TextFormField(
      controller: confirmPasswordController,
      autofocus: false,
      obscureText: confirmPasswordVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        labelText: "Confirmation du mot de passe",
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              confirmPasswordVisible = !confirmPasswordVisible;
            });
          },
          icon: Icon(confirmPasswordVisible ? Icons.visibility_off : Icons.visibility)
        )
      ),
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      validator: (value) {
        if(passwordController.text != value && passwordController.text.length > 6) {
          return ("Les mots de passe ne correspondent pas");
        }

        return null;
      },
      textInputAction: TextInputAction.done,
    );

    final ageField = TextFormField(
      controller: ageController,
      autofocus: false,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        labelText: "Age",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        )
      ),
      onSaved: (value) {
        ageController.text = value!;
      },
      validator: (value) {
        if(value!.isEmpty) {
          return ("Remplissez le champs Age");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
    );

    final classeField = TextFormField(
      controller: classeController,
      autofocus: false,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        labelText: "Classe",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        )
      ),
      onSaved: (value) {
        classeController.text = value!;
      },
      validator: (value) {
        if(value!.isEmpty) {
          return ("Remplissez le champs Classe");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );

    final signUpButton = ElevatedButton(
      onPressed: () {
        createUserWithEmailAndPassword();
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Text('Valider', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70, left: 30, bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Créer un compte", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40)),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: firstNameField
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: lastNameField
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ageField
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: classeField
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: emailField
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: passwordField
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: confirmPasswordField
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 0, top: 50),
                        child: signUpButton
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 30),
                child: 
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("🌽 J'ai déjà un compte", style: TextStyle(color: Colors.grey),),
                    )
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}