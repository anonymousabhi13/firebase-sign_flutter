import 'package:blog_app_flutter/components/round_button.dart';
import 'package:blog_app_flutter/screens/SignIn_page.dart';
import 'package:blog_app_flutter/screens/logIn.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/signin.png')),
              SizedBox(
                height: 10,
              ),
              Register_Button(context),
              SizedBox(
                height: 30,
              ),
              Login_Button(context)
            ],
          ),
        ),
      )),
    );
  }

  Container Login_Button(BuildContext context) {
    return Container(
              // clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                color: Colors.deepOrange,
                minWidth: double.infinity,
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print("clicked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
              ),
            );
  }

  Container Register_Button(BuildContext context) {
    return Container(
              child: MaterialButton(
                color: Colors.deepOrange,
                minWidth: double.infinity,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print("clicked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => logInpage()),
                  );
                },
              ),
            );
  }
}
