
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';
import 'login.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userEmail = TextEditingController();
  final userpassword = TextEditingController();
  final userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    final _auth = FirebaseAuth.instance;

    return Stack(
      children: [
        Container(
          height: _height / 4,
          width: _width,
          decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(150),
                bottomLeft: Radius.circular(300),
                // bottomRight: Radius.circular(200)
              )),
        ),
        Container(
          padding: EdgeInsets.only(left: _width / 5, top: _height / 15),
          child: const Text(
            '\n Create  \n  Account,',
            style: TextStyle(
                color: Color.fromARGB(255, 7, 1, 1),
                fontSize: 33,
                decoration: TextDecoration.none),
          ),
        ),
        Positioned(
          top: _height / 3.5,
          left: (_width - (_width / 1.2)) / 2,
          child: Container(
            height: _height / 1.7,
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
                      height: 30,
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      elevation: 20,
                      child: TextField(
                        controller: userName,
                        onSubmitted: (value) {
                          print("//------------------\n\n$value");

                          userName.text = value;
                        },
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "UserName",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
                        controller: userEmail,
                        onSubmitted: (value) {
                          print("//------------------\n\n$value");

                          userEmail.text = value;
                        },
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
                        onSubmitted: (value) {
                          print("//------------------\n\n$value");
                          userpassword.text = value;
                        },
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          final result = await Authentication(
                                  _auth, userEmail.text, userpassword.text)
                              .signUp();
                          final r = result.toString();
                          // print("//--------------$r-- --\n\n");
                          if(r=="Signed up"){
                             Navigator.push(
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
                        child: Text("signUp")),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text("Already Have an Acoount ? "),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text("Sign In")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: _height / 3.7,
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
  }
}
