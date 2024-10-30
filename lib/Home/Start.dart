import 'package:flutter/material.dart';
import '../Details/Continue.dart';
import '../Details/Vehicle.dart';

class SlidePage extends StatefulWidget {
  static const routeName = '/slidepage';
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/picky.png',
            height: 200, // Adjust the height as needed
            width: 200, // Adjust the width as needed
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 360,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContinuePage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.shopping_bag,
                                size: 60,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Delivery Product',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VehiclePage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 248, 223, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Order to deliver',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 223, 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust this according to your layout needs
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial Black',
                        ),
                      ),
                      // Add more children here if needed
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 223, 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust this according to your layout needs
                    children: [
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial Black',
                        ),
                      ),
                      // Add more children here if needed
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 223, 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust this according to your layout needs
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial Black',
                        ),
                      ),
                      // Add more children here if needed
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
