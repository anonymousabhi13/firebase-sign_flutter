import 'package:blog_app_flutter/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class logInpage extends StatefulWidget {
  @override
  _logInpageState createState() => _logInpageState();
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '', password = '';
}

class _logInpageState extends State<logInpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Login In",
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Login",
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
                      "SignIn",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (widget._formKey.currentState!.validate()) {
                        print("Validated");
                      }
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: widget.email, password: widget.password);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
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
