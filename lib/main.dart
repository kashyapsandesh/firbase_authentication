import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginsignupfirebase/screens/forget_page.dart';
import 'package:loginsignupfirebase/screens/homepage.dart';
import 'package:loginsignupfirebase/screens/loginScreen.dart';
import 'package:loginsignupfirebase/screens/signupScreen.dart';
import 'package:loginsignupfirebase/screens/welcome_screen.dart';
import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      theme: ThemeData(accentColor: Colors.pink),
      // home:  StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     if (snapshot.hasData) {
      //       return const AuthCompleteScreen();
      //     } else {
      //       return const WelcomeScreen();
      //     }
      //   },
      // ),

      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/loginscreen': (context) => const LoginScreen(),
        '/signupscreen': (context) => SignupScreen(),
        '/forgetscreen': (context) => ForgetPage(),
        '/authscreen': (context) => AuthCompleteScreen(),
      },
    );
  }
}
