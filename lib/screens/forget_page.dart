import 'package:flutter/material.dart';

import '../widgets/backButton.dart';
import '../widgets/inputfield.dart';
import '../widgets/loginButton.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  TextEditingController _emailController = TextEditingController();

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
                  'Forget Password?',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Don't worry it occurs to us all. We will send you a link to reset your password",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              InputField(
                isPassword: false,
                hintText: 'Enter your email',
                myController: _emailController,
              ),
              CustomButton(
                buttonColor: Colors.black,
                buttonText: 'Send Code',
                buttonTextColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(70.0),
                child: Row(
                  children: [
                    Text(
                      'Remember Password?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'Login',
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
