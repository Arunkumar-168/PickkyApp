import 'package:flutter/material.dart';
import 'package:pickky_app/API/Link.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/Home';
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
    );
  }
}
