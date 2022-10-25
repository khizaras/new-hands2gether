// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hands2gether/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hands2gether/pages/indexPage.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/current_user_model.dart';
import '../store/auth_user.dart';

String getUserName(BuildContext context) {
  CurrentUserModel user = context.watch<AuthenticatedUser>().currentUser;
  String? username = user.name;
  return username.toString();
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Widget build(BuildContext context) {
    return Consumer<AuthenticatedUser>(builder: (context, auth, child) {
      CurrentUserModel user = context.watch<AuthenticatedUser>().currentUser;
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      final emailController = TextEditingController();
      final passwordController = TextEditingController();

      if (user.uid != '') {
        Future.delayed(Duration(seconds: 0))
            .then((value) => Navigator.pushReplacementNamed(context, '/home'));
      }
      if (user.uid != '' && user.active == null) {
        Future.delayed(Duration(seconds: 0)).then(
            (value) => Navigator.pushReplacementNamed(context, '/profile'));
      }

      return Scaffold(
          backgroundColor: Colors.lightBlue[100],
          /* appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.lightBlue[900],
            title: Text(
              "Signup / Login page",
              style: TextStyle(color: Colors.white),
            ),
          ), */
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/login_bg.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  padding: EdgeInsets.all(10),
                  child: Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              height: 50,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: emailController,
                              style: TextStyle(
                                color: Colors.black,
                                height: 1,
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 216, 216, 216)),
                                  ),
                                  prefixIcon: Icon(Icons.mail),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Email",
                                  fillColor: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: passwordController,
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  prefixIcon: Icon(Icons.password_outlined),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        signinWithEmailPassword(
                                            emailController.text,
                                            passwordController.text,
                                            context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Column(
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.lightBlue[900],
                                      textStyle:
                                          TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    signInWithGoogle(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                      ),
                                      Text("Signin With Google",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.indigo[600],
                                      textStyle:
                                          TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    signInWithGoogle(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                      Text("Signin With Facebook",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.indigo[600],
                                      textStyle:
                                          TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    print(auth.toString());
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                      Text("user",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ));
    });
  }
}

void signinWithEmailPassword(
    String emailAddress, String password, BuildContext context) async {
  try {
    print("${emailAddress} ${password}");
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    User? autenticatedUser = credential.user;
    context.read<AuthenticatedUser>().updateLogin(autenticatedUser!);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

void signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  FirebaseAuth.instance.signInWithCredential(credential).then((creds) {
    User? autenticatedUser = creds.user;
    context.read<AuthenticatedUser>().updateLogin(autenticatedUser!);
  }).onError((error, stackTrace) {
    print(error);
  });
}
