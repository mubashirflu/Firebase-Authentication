// import 'package:drawing_app/functions/auth_functions.dart';
// import 'package:drawing_app/screen/bannerpage.dart';
// import 'package:flutter/material.dart';

// class Signin extends StatefulWidget {
//   const Signin({super.key});

//   @override
//   State<Signin> createState() => _SigninState();
// }

// class _SigninState extends State<Signin> {
//   @override
//   final _formKey = GlobalKey<FormState>();
//   bool isLogin = false;
//   String username = '';
//   String email = '';
//   String password = '';
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.indigo,
//         title: const Text(
//           "Authentication",
//           style: TextStyle(
//               fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Container(
//           margin: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               isLogin
//                   ? TextFormField(
//                       validator: (value) {
//                         if (value.toString().length < 3) {
//                           return "username is too small";
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         setState(() {
//                           username = value!;
//                         });
//                       },
//                       key: const ValueKey("username"),
//                       decoration: const InputDecoration(
//                         hintText: "Enter UserName",
//                         suffixIcon: Icon(Icons.person),
//                       ),
//                     )
//                   : Container(),
//               TextFormField(
//                 validator: (value) {
//                   if (!(value.toString().contains("@"))) {
//                     return "Invalid Email Address";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     email = value!;
//                   });
//                 },
//                 key: const ValueKey("email"),
//                 decoration: const InputDecoration(
//                   hintText: "Enter your Email",
//                   suffixIcon: Icon(Icons.email),
//                 ),
//               ),
//               TextFormField(
//                 validator: (value) {
//                   if (value.toString().length < 6) {
//                     return "password is too small";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     password = value!;
//                   });
//                 },
//                 key: const ValueKey("password"),
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: "Enter your Password",
//                   suffixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style:
//                       ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                       isLogin
//                           ? SignUp(email, password)
//                           : SignIn(email, password);
//                       Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(
//                             builder: (context) => const Homepage()),
//                         (Route<dynamic> route) => false,
//                       );
//                     }
//                   },
//                   child: isLogin
//                       ? const Text(
//                           "Sign Up",
//                           style: TextStyle(color: Colors.white, fontSize: 18.0),
//                         )
//                       : const Text(
//                           "Login",
//                           style: TextStyle(color: Colors.white, fontSize: 18.0),
//                         ),
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isLogin = !isLogin;
//                   });
//                 },
//                 child: isLogin
//                     ? const Text("Already have an Account? Login")
//                     : const Text("Dont have an Account? Signup"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:drawing_app/functions/auth_functions.dart';
import 'package:drawing_app/screen/bannerpage.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isPassword = true;
  void showpassword() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Authentication",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLogin
                  ? TextFormField(
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return "Username is too small";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      key: const ValueKey("username"),
                      cursorColor: Colors.amber,
                      decoration: const InputDecoration(
                        hintText: "Enter user Name:",
                        suffixIcon: Icon(Icons.person),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    )
                  : Container(),
              TextFormField(
                validator: (value) {
                  if (!(value.toString().contains("@"))) {
                    return "Invalid Email Address";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
                key: const ValueKey("email"),
                cursorColor: Colors.amber,
                decoration: const InputDecoration(
                  hintText: "Enter your Email Address:",
                  suffixIcon: Icon(Icons.email),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.toString().length < 6) {
                    return "Password is too small";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
                key: const ValueKey("password"),
                obscureText: isPassword,
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  hintText: "Enter your Password:",
                  suffixIcon: IconButton(
                    onPressed: showpassword,
                    icon: Icon(
                      isPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off,
                    ),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      isLogin
                          ? signInLogin(email, password)
                          : signUpSign(email, password);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                  child: isLogin
                      ? const Text(
                          "Signup",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: isLogin
                    ? const Text(
                        "Already have an Account? Login",
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      )
                    : const Text(
                        "Dont have an Accont? Signup",
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
