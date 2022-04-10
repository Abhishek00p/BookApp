import 'package:bookshelfs/Screens/purchase_summary.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  void setfunc(String booktitle) {}

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: _height / 1.7,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: _height / 1.8,
                        width: _width,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Stack(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.favorite)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Positioned(
                              bottom: 120,
                              left: _width / 2 - 75,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Image.asset(
                                    "images/rich_dad.jpg",
                                    fit: BoxFit.fill,
                                    height: 200,
                                    width: 150,
                                  ),
                                ),
                              )),
                          Positioned(
                              bottom: 30,
                              left: _width / 4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Book Title fh df ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "by  Author Name ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("rating"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("Pages"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("Price"),
                                      SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ]),
                      ),
                    ),
                    Positioned(
                        top: _height / 1.8 - 20,
                        left: _width / 2 - 115,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Purchase_summary()));
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(230, 0, 0, 0),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        )),
                                    height: 40,
                                    width: 110,
                                    child: Center(
                                        child: Text(
                                      "Order Now",
                                      style: TextStyle(color: Colors.white),
                                    ))),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(230, 0, 0, 0),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  height: 40,
                                  width: 120,
                                  child: Center(
                                      child: Text(
                                    "In Stock ",
                                    style: TextStyle(color: Colors.white),
                                  )))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                height: 600,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Some of the rooms are very clean and stylishly old-fashioned, while some have an old, country feel to them. Isn’t it amazing? WithSome of the rooms are very clean and stylishly old-fashioned, while some have an old, country feel to them. Isn’t it amazing? With a home like this, you almost feel like royalty yourself. a home like this, you almost feel like royalty yourself.",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
