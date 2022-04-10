import 'package:bookshelfs/tabs/homepage.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: _height / 3.37,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: _height / 4,
                        width: _width,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(style: BorderStyle.solid))),
                        child: Image.asset(
                          "images/background.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 15,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border(
                                left: BorderSide(width: 3, color: Colors.blue),
                                right: BorderSide(width: 3, color: Colors.blue),
                                bottom:
                                    BorderSide(width: 3, color: Colors.blue),
                                top: BorderSide(width: 3, color: Colors.blue),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Go Back",
                                style: TextStyle(color: Colors.black),
                              )),
                        )),
                    Positioned(
                        top: _height / 4 - 30,
                        left: _width / 2 - 25,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("images/user1.jpg"),
                          ),
                        )),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Profile",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                Container(
                  height: 600,
                  width: _width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 201, 201, 201),
                            Colors.white,
                            // Color.fromARGB(255, 201, 201, 201),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.3, 0.99])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "User Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Score",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Score",
                              style: TextStyle(
                                  color: Colors.indigoAccent, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          "Increase Your Score by Reading More Books",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 10,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 10, right: 15),
                                child: Text("Total books Read : ")),
                            Text("2"),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: _width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            // color: Colors.amberAccent,
                            border: Border(
                                top: BorderSide(), bottom: BorderSide())),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Contact Info :",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      size: 16,
                                    ),
                                    label: Text("Edit"))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email :"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("Phone Number :"),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            // color: Colors.amberAccent,
                            border: Border(bottom: BorderSide())),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Address :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 16),
                                ),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      size: 16,
                                    ),
                                    label: Text("Edit"))
                              ],
                            ),
                            Text(
                                "The address fgjbhfg fjbgnf gfjhgfgfjhgfm gfhgn fmgfgf gffhjgf kjfhgmf ghfgmf gkh"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Follow Us on :",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Instagram "),
                                    Image.asset(
                                      "images/Paytm_Logo.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("@handle"),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("FaceBook "),
                                    Image.asset(
                                      "images/Paytm_Logo.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("@handle"),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Twitter "),
                                    Image.asset(
                                      "images/Paytm_Logo.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("@handle"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
