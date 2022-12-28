import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCompleteScreen extends StatelessWidget {
  AuthCompleteScreen({super.key});

  final String username = FirebaseAuth.instance.currentUser!.displayName!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are logged in',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/authscreen');
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
