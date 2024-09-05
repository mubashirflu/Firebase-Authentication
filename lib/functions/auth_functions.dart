// import 'package:drawing_app/screen/Signin.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// SignUpSign(String email, String password) async {
//   try {
//     final credential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// SignInLogin(String email, String password) async {
//   try {
//     final credential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//     print("Successfully Login");
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//     }
//   }
// }

// Future<void> SignOut(BuildContext context) async {
//   try {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const Signin()),
//     );
//     // Navigator.pushReplacementNamed(context,
//     //     '/login');
//   } catch (e) {
//     // Handle errors, such as showing a SnackBar or dialog
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error signing out: $e')),
//     );
//   }
// }

import 'package:drawing_app/screen/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signUpSign(String email, String password) async {
  try {
    final UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("Successfully registered: ${credential.user?.email}");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    } else {
      print('Failed to register: $e');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> signInLogin(String email, String password) async {
  try {
    final UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Successfully logged in: ${credential.user?.email}");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print('Failed to login: $e');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Signin()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error signing out: $e')),
    );
  }
}
