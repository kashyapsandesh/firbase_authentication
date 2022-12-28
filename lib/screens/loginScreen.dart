import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginsignupfirebase/screens/services/firebase_auth_service.dart';
import 'package:loginsignupfirebase/widgets/inputfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/backButton.dart';
import '../widgets/loginButton.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                  'Welcome back,\nGlad to see you again!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              InputField(
                isPassword: false,
                hintText: 'Enter your email',
                myController: _emailController,
              ),
              InputField(
                isPassword: true,
                hintText: 'Enter your password',
                myController: _passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgetscreen');
                    },
                    child: Text(
                      'Forget Password?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              CustomButton(
                buttonColor: Colors.black,
                buttonText: 'Login',
                buttonTextColor: Colors.white,
                onPressed: () async {
                  try {
                    await FirebaseAuthService().login(
                        _emailController.text.trim(),
                        _passwordController.text.trim());
                    if (FirebaseAuth.instance.currentUser != null) {
                      Navigator.pushNamed(context, '/authscreen');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              'Invalid UserName and password. Please register again or make sure that username and password is correct.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'home');
                              },
                              child: Text('Register Now'),
                            )
                          ],
                        ),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
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
                      width: MediaQuery.of(context).size.height * 0.18,
                    ),
                    Text('Or Login With '),
                    Container(
                      height: 1,
                      color: Colors.black,
                      width: MediaQuery.of(context).size.height * 0.18,
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
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        // color: Colors.blue,
                      ),
                      onPressed: () async {
                        await FirebaseAuthService().logininwithgoogle();

                        if (FirebaseAuth.instance.currentUser != null) {
                          if (!mounted) return;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthCompleteScreen()));
                        } else {
                          throw Exception("Error");
                        }
                      },
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
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'Create account',
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
