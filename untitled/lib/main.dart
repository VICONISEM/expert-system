import 'package:flutter/material.dart';
import 'splash_page.dart'; // Import the splash screen file
import 'login_page.dart'; // Import the login page file
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppShell(), // Use MyAppShell widget as the home
    );
  }
}           










class MyAppShell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)), // Reduced splash screen delay to 2 seconds
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the delay, show the splash screen
          return SplashScreen();
        } else {
          // After delay, navigate to the login page
          return LoginPage();
        }
      },
    );
  }
}
