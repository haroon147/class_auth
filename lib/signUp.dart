import 'package:class_auth/homePage.dart';
import 'package:class_auth/login.dart';
import 'package:class_auth/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("SignUp Screen"),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  fillColor: Colors.red,
                  hintText: "Email",
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  fillColor: Colors.red,
                  hintText: "Password",
                  icon: Icon(Icons.password),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    _auth
                        .createUserWithEmailAndPassword(
                            email: _emailController.text.toString(),
                            password: _passwordController.text.toString())
                        .then((value) {})
                        .onError((error, stackTrace){
                          Utils().toast(error.toString());
                    });
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
                },
                child: const Text("Button"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
