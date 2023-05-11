import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool passwordVisible = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset(
            "images/login_image.png",
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(isLogin ? "Se connecter" : "Créer un compte",
                      style:
                          const TextStyle(fontWeight: FontWeight.w900, fontSize: 40)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerEmail,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 240, 240, 240),
                          labelText: "Email",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        controller: _controllerPassword,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                            labelText: "Mot de passe",
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, left: 5),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '*minimum 8 caractères et 1 caractère spécial',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75),
                                  fontSize: 12),
                            ))),
                    Text(errorMessage == '' ? '' : 'Humm ? $errorMessage'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 200, top: 50),
                child: ElevatedButton(
                  onPressed: isLogin
                      ? signInWithEmailAndPassword
                      : createUserWithEmailAndPassword,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Text(
                      isLogin ? 'Valider' : 'Valider',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10, right: 30),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          isLogin
                              ? "🌽 Pas encore de compte ? Je m'inscris"
                              : "🌽 J'ai déjà un compte",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
