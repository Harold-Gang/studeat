import 'package:app/pages/home_page.dart';
import 'package:app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool isLoading = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signInWithEmailAndPassword() async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      ).then((uid) => {
        isLoading = false,
        Fluttertoast.showToast(msg: "Login successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()))

      }).catchError((e) => {
        isLoading = false,
        Fluttertoast.showToast(msg: e!.message)
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
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
                  const Padding(
                    padding: EdgeInsets.all(40),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Se connecter", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40)),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _controllerEmail,
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
                              _controllerEmail.text = value!;
                            },
                            validator: (value) {
                              if(value!.isEmpty) {
                                return ("Please enter your email");
                              }
                              if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
                                return ("Please enter a valid email address");
                              }
      
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: TextFormField(
                              controller: _controllerPassword,
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
                                _controllerPassword.text = value!;
                              },
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{8,}$');
                                if(value!.isEmpty) {
                                  return ("Please enter a password");
                                }
                                if(!regex.hasMatch(value)) {
                                  return ("Please enter a valid password (8 chara. mini)");
                                }
                                
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('*minimum 8 caractères et 1 caractère spécial', style: TextStyle(color: Color.fromARGB(255, 75, 75, 75), fontSize: 12),)
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 200, top: 50),
                            child: ElevatedButton(
                              onPressed: signInWithEmailAndPassword,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                                child: Text('Valider', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text("🌽 Pas encore de compte ? Je m'inscris", style: TextStyle(color: Colors.grey),),
                        )
                      )
                  )
                ],
              )
            ],
          ),
        ),

        if(isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if(isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ]
    );
  }

}