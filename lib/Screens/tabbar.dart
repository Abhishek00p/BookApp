import 'package:bookshelfs/Screens/BookDetails.dart';
import 'package:flutter/material.dart';

class tabbarview {
  List<Widget> tabbarView = [
    // for New
    Container(
      padding: EdgeInsets.all(15),
      height: 210,
      child: ListView.builder(
          padding: EdgeInsets.only(right: 30),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                width: 150,
                height: 210,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/rich_dad.jpg"))),
              ),
            );
          })),
    ),

    // for Trending

    Container(
      padding: EdgeInsets.all(15),
      height: 210,
      child: ListView.builder(
          padding: EdgeInsets.only(right: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () => Book(),
              child: Card(
                elevation: 5,
                child: Container(
                  width: 150,
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/rich_dad.jpg"))),
                ),
              ),
            );
          })),
    ),

    //Authors

    Container(
      padding: EdgeInsets.all(15),
      height: 210,
      child: ListView.builder(
          padding: EdgeInsets.only(right: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Card(
              elevation: 5,
              child: Container(
                width: 150,
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/rich_dad.jpg"))),
              ),
            );
          })),
    )
  ];
  List<Widget> mytabbarfun() {
    return tabbarView;
  }
}
