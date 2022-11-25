import 'package:blog_app_flutter/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '', password = '';
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Create Account",
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Register",
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
          ),
          Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Email_control(),
              Password_control(),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: MaterialButton(
                    color: Colors.deepOrange,
                    minWidth: double.infinity,
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: widget.email,
                          password: widget.password,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }

                      //
                    },
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  TextFormField Password_control() {
    return TextFormField(
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
      ),
      onChanged: (value) => widget.password = value,
      validator: (value) => value!.isEmpty ? "Password is required" : null,
    );
  }

  TextFormField Email_control() {
    return TextFormField(
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter your email",
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
      ),
      onChanged: (value) => widget.email = value,
      validator: (value) => value!.isEmpty ? "Email is required" : null,
    );
  }
}
