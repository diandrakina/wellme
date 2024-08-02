// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:projekril/tab_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:well_me/check.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginRegisterPageState();
  }
}

var userCredentials;

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  var isObscure = true;
  var isLogin = true;

  var _enteredFirstName = "";
  var _enteredLastName = "";
  var _enteredEmail = "";
  var _enteredPassword = "";

  final _form = GlobalKey<FormState>();
  String _password = "";

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    if (isLogin) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Check(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Check(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget theForm = Form(
      key: _form,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(fontFamily: 'Poppins'),
              prefixStyle: TextStyle(fontFamily: 'Poppins'),
              errorStyle: TextStyle(fontFamily: 'Poppins'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 120, 0, 1),
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
              counterText: "",
            ),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            style: TextStyle(fontFamily: 'Poppins'),
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !value.contains("@")) {
                return "Please enter a valid email address!";
              }
              return null;
            },
            onSaved: (newValue) {
              _enteredEmail = newValue!;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(fontFamily: 'Poppins'),
              prefixStyle: TextStyle(fontFamily: 'Poppins'),
              errorStyle: TextStyle(fontFamily: 'Poppins'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 120, 0, 1),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              counterText: "",
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
            ),
            obscureText: isObscure,
            style: TextStyle(fontFamily: 'Poppins'),
            validator: (value) {
              if (value!.length < 6) {
                return "Please enter a password with atleast 6 character";
              }
              return null;
            },
            onSaved: (newValue) {
              _enteredPassword = newValue!;
            },
          ),
        ],
      ),
    );

    if (!isLogin) {
      theForm = Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "First Name",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                prefixStyle: TextStyle(fontFamily: 'Poppins'),
                errorStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 120, 0, 1),
                  ),
                ),
                // constraints: const BoxConstraints(maxHeight: 60),
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                counterText: "",
              ),
              keyboardType: TextInputType.name,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              style: TextStyle(fontFamily: 'Poppins'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a name!";
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredFirstName = newValue!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Last Name",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                prefixStyle: TextStyle(fontFamily: 'Poppins'),
                errorStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 120, 0, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                counterText: "",
              ),
              keyboardType: TextInputType.name,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              style: TextStyle(fontFamily: 'Poppins'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a name!";
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredLastName = newValue!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                prefixStyle: TextStyle(fontFamily: 'Poppins'),
                errorStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 120, 0, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                counterText: "",
              ),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              style: TextStyle(fontFamily: 'Poppins'),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains("@")) {
                  return "Please enter a valid email address!";
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredEmail = newValue!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                prefixStyle: TextStyle(fontFamily: 'Poppins'),
                errorStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 120, 0, 1),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                counterText: "",
              ),
              style: TextStyle(fontFamily: 'Poppins'),
              validator: (value) {
                if (value!.length < 6) {
                  return "Please enter a password with atleast 6 character";
                }
                _password = value;
                return null;
              },
              obscureText: isObscure,
              onSaved: (newValue) {
                _enteredPassword = newValue!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Confirm your password",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                prefixStyle: TextStyle(fontFamily: 'Poppins'),
                errorStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 120, 0, 1),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                counterText: "",
              ),
              obscureText: isObscure,
              style: TextStyle(fontFamily: 'Poppins'),
              validator: (value) {
                if (value!.length < 6) {
                  return "Please enter a password with atleast 6 character";
                }

                if (value != _password) {
                  return "Password not match";
                }

                return null;
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: AssetImage('assets/images/logo.png'),
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  isLogin ? 'Sign In' : "Sign Up",
                  style: const TextStyle(
                    fontSize: 35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                theForm,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color.fromRGBO(120, 0, 1, 10),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    padding: isLogin
                        ? const EdgeInsets.fromLTRB(144, 13, 144, 13)
                        : const EdgeInsets.fromLTRB(130, 13, 136, 13),
                    backgroundColor: const Color.fromRGBO(1, 47, 71, 1),
                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Text(
                    isLogin ? "Sign In" : "Join Now",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ),
                if (isLogin)
                  const SizedBox(
                    height: 80,
                  ),
                if (isLogin)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '- Or sign in with -',
                        style: TextStyle(
                            color: Color.fromRGBO(127, 127, 127, 10),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                if (isLogin)
                  const SizedBox(
                    height: 20,
                  ),
                if (isLogin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          ;
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Image.network(
                            "https://raw.githubusercontent.com/noirelyx/SE_Project/main/google.png",
                            height: 40,
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white),
                      //     borderRadius: BorderRadius.circular(12),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.5),
                      //         spreadRadius: 2,
                      //         blurRadius: 5,
                      //         offset: const Offset(0, 3),
                      //       )
                      //     ],
                      //   ),
                      //   child: Image.network(
                      //     "https://raw.githubusercontent.com/noirelyx/SE_Project/main/facebook.png",
                      //     height: 40,
                      //   ),
                      // ),
                      // Container(
                      //   padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white),
                      //     borderRadius: BorderRadius.circular(12),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.5),
                      //         spreadRadius: 2,
                      //         blurRadius: 5,
                      //         offset: const Offset(0, 3),
                      //       )
                      //     ],
                      //   ),
                      //   child: Image.network(
                      //     "https://raw.githubusercontent.com/noirelyx/SE_Project/main/linkedin.png",
                      //     height: 40,
                      //   ),
                      // ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin
                          ? 'Don\'t have an account?'
                          : 'Already have an account?',
                      style: const TextStyle(
                          color: Color.fromRGBO(26, 26, 19, 10),
                          fontFamily: 'Poppins'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                          _form.currentState!.reset();
                        });
                      },
                      child: Text(
                        isLogin ? "Sign up" : "Sign in",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// signInWithGoogle(BuildContext ctx) async {
//   GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

//   GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;

//   AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//   print(userCredential.user?.displayName);
//   Navigator.pushReplacement(
//       ctx,
//       MaterialPageRoute(
//         builder: (context) => TabScreen(),
//       ));
// }
