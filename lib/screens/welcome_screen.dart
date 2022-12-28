import 'package:flutter/material.dart';

import '../widgets/loginButton.dart';
import 'loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginscreen');
                },
                buttonColor: Colors.black,
                buttonText: 'Login',
                buttonTextColor: Colors.white),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signupscreen');
                },
                buttonColor: Colors.grey,
                buttonText: 'Signup',
                buttonTextColor: Colors.white),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Continue as a Guest',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
