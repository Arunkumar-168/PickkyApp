import 'package:flutter/material.dart';
import 'package:pickky_app/API/Link.dart';

class BookPage extends StatefulWidget {
  static const routeName = '/Book';
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
    );
  }
}
