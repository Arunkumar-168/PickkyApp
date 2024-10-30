import 'package:flutter/material.dart';
import 'package:pickky_app/Bottom/Logout.dart';
import 'package:pickky_app/Bottom/Profile.dart';
import 'package:pickky_app/Home/tabs_screen.dart';

import 'FrontPage/FrontPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.yellow,
          selectionColor: Colors.yellow,
          selectionHandleColor: Colors.yellow,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/home': (ctx) => const TabsScreen(),
        LoginPage.routeName: (ctx) => const LoginPage(),
        SignupPage.routeName: (ctx) => const SignupPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: Image.asset(
            'assets/images/d2.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
