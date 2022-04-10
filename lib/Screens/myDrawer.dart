import 'dart:ui';

import 'package:bookshelfs/tabs/homepage.dart';
import 'package:bookshelfs/tabs/favorite.dart';
import 'package:bookshelfs/tabs/orders.dart';
import 'package:bookshelfs/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class myDrawer extends StatelessWidget {
  final mypading = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.deepOrangeAccent,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amberAccent,
              backgroundImage: AssetImage(
                "images/user1.jpg",
                // fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2.0,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: myMenuItem(
                  text: "Home",
                  icon: Icons.home,
                  onclicked: () => selectedItem(context, 0)),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: myMenuItem(
                  text: "My orders",
                  icon: Icons.library_books,
                  onclicked: () => selectedItem(context, 1)),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: myMenuItem(
                  text: "Favorite",
                  icon: Icons.favorite,
                  onclicked: () => selectedItem(context, 2)),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: myMenuItem(
                  text: "Profile",
                  icon: Icons.person,
                  onclicked: () => selectedItem(context, 3)),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

Widget myMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onclicked,
}) {
  final color = Colors.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        )),
    onTap: onclicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Orders()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Favorite()));
      break;
    case 3:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyProfile()));
      break;
  }
}
