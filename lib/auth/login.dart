
import 'package:bookshelfs/auth/registeration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../tabs/homepage.dart';
import 'authentication.dart';

final GoogleSignIn _signIn = GoogleSignIn(scopes: ['email']);
GoogleSignInAccount? curUser;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    _signIn.onCurrentUserChanged.listen((account) {
      setState(() {
        curUser = account;
      });
    });
    _signIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    GoogleSignInAccount? user = curUser;

    final userEmail = TextEditingController();
    final userpassword = TextEditingController();

    if (user == null) {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      return Stack(
        children: [
          Container(
            height: _height / 4,
            width: _width / 1.1,
            decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(150),
                    // bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(200))),
          ),
          Container(
            padding: EdgeInsets.only(left: _width / 6, top: _height / 15),
            child: const Text(
              '\nWelcome  \n  Back,',
              style: TextStyle(
                  color: Color.fromARGB(255, 7, 1, 1),
                  fontSize: 33,
                  decoration: TextDecoration.none),
            ),
          ),
          Positioned(
            top: _height / 3.5,
            left: (_width - (_width / 1.2)) / 2,
            child: SingleChildScrollView(
              child: Container(
                height: _height / 1.62,
                width: _width / 1.2,
                padding: EdgeInsets.all(10),
                child: Card(
                  // margin: EdgeInsets.all(10.0),
                  borderOnForeground: true,
                  color: Colors.white,
                  shadowColor: Colors.amberAccent,
                  elevation: 25.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Card(
                          color: Colors.grey.shade100,
                          elevation: 20,
                          child: TextField(
                            controller: userEmail,
                            style: TextStyle(fontSize: 15),
                            keyboardType: TextInputType.emailAddress,
                            onSubmitted: (value) {
                              userEmail.text = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          color: Colors.grey.shade100,
                          elevation: 20,
                          child: TextField(
                            controller: userpassword,
                            style: TextStyle(fontSize: 15),
                            keyboardType: TextInputType.visiblePassword,
                            // obscureText: true,
                            onSubmitted: (value) {
                              userpassword.text = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoadingScreen()));
                              final result = await Authentication(
                                      _auth, userEmail.text, userpassword.text)
                                  .checkIfEmailInUse();
                              print("//----------$result");
                              if (result) {
                                print("entered");
                                Navigator.of(context).popUntil((route) => route.isFirst);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  HomePage()));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepOrangeAccent),
                                elevation: MaterialStateProperty.all(10),
                                animationDuration: Duration(seconds: 2)),
                            child: Text("Login")),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text("-------------- OR --------------"),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                            child: FloatingActionButton.extended(
                          onPressed: () {
                            signInn();
                          },
                          label: Text("Sign in with Google"),
                          icon: Image.asset(
                            "images/google_logo.png",
                            height: 32,
                            width: 32,
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text("Register Here"))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: _height / 3.8,
            left: _width / 2.2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "images/account.png",
                color: Colors.black,
              ),
              radius: 27,
            ),
          ),
        ],
      );
    } else {
      return HomePage();
    }
  }
}

Future<bool> signInn() async {
  try {
    await _signIn.signIn();
    return true;
  } catch (e) {
    print("//-------------something was wrong : " + e.toString());
    return false;
  }
}
