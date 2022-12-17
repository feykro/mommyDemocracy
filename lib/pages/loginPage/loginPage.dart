import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mommy_democracy/pages/homePage/homePage.dart';
import 'package:mommy_democracy/pages/loginPage/loginPageViewModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageViewModel model = LoginPageViewModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //  TODO: make a view model to handle functionnalities
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "email",
                ),
                validator: ((value) {
                  if ((value ?? "").contains("@")) {
                    return "Please enter a correct email address";
                  }
                  return null;
                }),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  hintText: "password",
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  model.connectWithEmailAndPassword(emailController.text, passwordController.text).then((value) {
                    if (value) {
                      //  TODO: loginController.setUserInfo
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
                    } else {
                      //  TODO: show error dialog
                    }
                  }).onError((error, stackTrace) {
                    log("Error logging in");
                    //  TODO: show error dialog
                  });
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
