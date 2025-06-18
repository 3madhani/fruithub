import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void signout() async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
  await FacebookAuth.instance.logOut();
}
