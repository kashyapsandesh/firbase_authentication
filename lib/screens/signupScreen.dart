import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginsignupfirebase/screens/services/firebase_auth_service.dart';

import '../widgets/backButton.dart';
import '../widgets/inputfield.dart';
import '../widgets/loginButton.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello! Register to get\nstarted',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              InputField(
                isPassword: false,
                hintText: 'Username',
                myController: _usernameController,
              ),
              InputField(
                isPassword: false,
                hintText: 'Email',
                myController: _emailController,
              ),
              InputField(
                isPassword: true,
                hintText: 'Password',
                myController: _passwordController,
              ),
              InputField(
                isPassword: true,
                hintText: 'Confirm Password',
                myController: _confirmPasswordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              CustomButton(
                buttonColor: Colors.black,
                buttonText: 'Register',
                buttonTextColor: Colors.white,
                onPressed: () async {
                  try {
                    await FirebaseAuthService().signup(
                        _emailController.text.trim(),
                        _passwordController.text.trim());
                    Navigator.pushNamed(context, '/loginscreen');
                  } on FirebaseException catch (e) {
                    print(e.message);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 1,
                      color: Colors.black,
                      width: MediaQuery.of(context).size.height * 0.17,
                    ),
                    Text(' Or Register With '),
                    Container(
                      height: 1,
                      color: Colors.black,
                      width: MediaQuery.of(context).size.height * 0.17,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          Icon(FontAwesomeIcons.facebook, color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.google, color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.apple, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Already have an account',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      ' Login Now',
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
