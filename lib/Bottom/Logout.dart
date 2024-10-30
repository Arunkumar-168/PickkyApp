import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pickky_app/API/Link.dart';
import 'package:pickky_app/Bottom/Profile.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool hidePassword = true;
  bool _isLoading = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _whatappController = TextEditingController();

  Future<void> _submit() async {
    if (!globalFormKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    globalFormKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    setState(() {
      _isLoading = false;
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your account has been created successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showAlreadyRegisteredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Already Registered'),
          // content: Text('The provided email is already registered.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  InputDecoration getInputDecoration(String hintext, IconData iconData,
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
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.orange),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.orange),
      ),
      filled: true,
      prefixIcon: Icon(
        iconData,
        size: 18.0, // Adjust the size as needed
        color: kTextLowBlackColor,
      ),
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintext,
      fillColor: kBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/picky.png',
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Form(
                key: globalFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.grey[200],
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: kBackgroundColor,
                          child: Image.asset(
                            'assets/images/r4.jpg',
                            height: 65,
                          ),
                        ),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                            child: Text(
                              'First Name',
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
                            decoration:
                                getInputDecoration('First Name', Icons.person),
                            keyboardType: TextInputType.name,
                            controller: _firstNameController,
                            // ignore: missing_return
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'First name cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // _authData['email'] = value.toString();
                              _firstNameController.text = value as String;
                            },
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                            child: Text(
                              'Last Name',
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
                            decoration: getInputDecoration(
                              'Last Name',
                              Icons.person,
                            ),
                            keyboardType: TextInputType.name,
                            controller: _lastNameController,
                            // ignore: missing_return
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Last name cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // _authData['email'] = value.toString();
                              _lastNameController.text = value as String;
                            },
                          ),
                        ),
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
                              // _authData['email'] = value.toString();
                              _emailController.text = value as String;
                            },
                          ),
                        ),
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
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            onSaved: (input) {
                              // _authData['password'] = input.toString();
                              _passwordController.text = input as String;
                            },
                            validator: (input) {
                              return input!.isEmpty
                                  ? "Please Enter Your password"
                                  : null;
                            },
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.orange, width: 2),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: const TextStyle(
                                  color: Colors.black54, fontSize: 14),
                              hintText: "password",
                              fillColor: kBackgroundColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 15),
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                color: kTextLowBlackColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: kTextLowBlackColor,
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                            child: Text(
                              'Whatsapp Number',
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
                            decoration: getInputDecoration(
                                'WhatsApp Number', FontAwesomeIcons.whatsapp),
                            keyboardType: TextInputType
                                .phone, // Using TextInputType.phone for numeric keyboard
                            controller: _whatappController,
                            // maxLength: 10, // Limiting input to 10 characters
                            // ignore: missing_return
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your mobile number';
                              } else if (value.length != 10) {
                                return 'Mobile number must be 10 digits';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // _authData['email'] = value.toString();
                              _whatappController.text = value as String;
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.orange),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15,
                                      top: 10,
                                      bottom: 10),
                                  child: MaterialButton(
                                    elevation: 0,
                                    onPressed: _submit,
                                    color: Colors.orange,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                      // side: const BorderSide(color: kRedColor),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign Up',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: kTextLowBlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(LoginPage.routeName); // Fix typo here
                    },
                    child: const Text(
                      ' Sign In',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
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
    );
  }
}
