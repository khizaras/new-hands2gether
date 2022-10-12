import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hands2gether/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../models/current_user_model.dart';
import '../store/auth_user.dart';

String getUserName(BuildContext context) {
  CurrentUserModel user = context.watch<AuthenticatedUser>().currentUser;
  var username = user.name;
  return username.toString();
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late FirebaseAuth user;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer<AuthenticatedUser>(builder: (context, dishum, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Signup / Login page"),
        ),
        body: Column(
          children: [
            Center(child: Text(getUserName(context))),
            Center(
                child: IconButton(
              icon: const Icon(Icons.login),
              onPressed: () => {signInWithGoogle(context)},
            ))
          ],
        ),
      );
    });
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
