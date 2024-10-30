import 'package:flutter/material.dart';

import '../Home/tabs_screen.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool hidePassword = true;
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  InputDecoration getInputDecoration(String hintText, IconData iconData,
      {double iconSize = 1.0}) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.orange, width: 2),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      filled: true,
      prefixIcon: Icon(
        iconData,
        size: 20.0, // Adjust the size as needed
        color: Colors.black, // Change the color if needed
      ),
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintText,
      fillColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }

  Future<void> _submit() async {
    if (!globalFormKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    globalFormKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    // Simulate async operation
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to next screen
    Navigator.pushNamed(context, '/home');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate to the previous screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TabsScreen()),
              );
            },
          ),
          title: Image.asset(
            'assets/images/picky.png',
            height: 200, // Adjust the height as needed
            width: 200, // Adjust the width as needed
          ),
        ),
        body: SingleChildScrollView(
        child: Form(
          key: globalFormKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.grey[200],
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/d5.jpg',
                      height: 70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      cursorColor: Colors.orange,
                      cursorHeight: 20,
                      decoration: getInputDecoration(
                        'Email',
                        Icons.email_outlined,
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) =>
                          !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(input!)
                              ? "Email Id should be valid"
                              : null,
                      onSaved: (value) {
                        _authData['email'] = value.toString();
                        _emailController.text = value as String;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 15.0, bottom: 4.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.orange,
                      cursorHeight: 20,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      onSaved: (input) {
                        _authData['password'] = input.toString();
                        _passwordController.text = input as String;
                      },
                      validator: (input) {
                        return input!.isEmpty
                            ? "Please enter a password"
                            : null;
                      },
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        hintText: "password",
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 15),
                        prefixIcon: const Icon(
                          Icons.lock_outlined,
                          size: 20.0,
                          color: Colors.black, // Change the color if needed
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Colors.black, // Change the color if needed
                          icon: Icon(hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: MaterialButton(
                              elevation: 0,
                              color: Colors.orange,
                              onPressed: _submit,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                                side: const BorderSide(color: Colors.orange),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Log In',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Do not have an account?',
                          style: TextStyle(
                            color: Colors.black, // Change the color if needed
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: const Text(
                            ' Sign up',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color:
                                  Colors.orange, // Change the color if needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
