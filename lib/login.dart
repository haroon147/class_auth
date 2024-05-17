
import 'package:class_auth/homePage.dart';
import 'package:class_auth/signUp.dart';
import 'package:class_auth/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}

@override
final formkey2 = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
//
// final _auth = FirebaseAuth.instance;
//
// void Login() {
//   _auth.signInWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text.toString())
//       .then((value) {
//     Utils().toast(value.user!.email.toString());
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => homePage()));
//   }).onError((error, stackTrace) {
//     Utils().toast(error.toString());
//   });
// }

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login Screen"),
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
                height: 30,
              ),
              // TextButton(
              //     onPressed: () {
              //       if (formkey2.currentState!.validate()) {
              //         const login();
              //       }
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const homePage()));
              //     },
              //     child: const Text("Login")),,
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> homePage()));

                    print('Signed in: ${userCredential.user}');
                  } catch (e) {
                    Utils().toast(e.toString());
                  }
                },
                child: Text('Sign In'),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("SignUp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
