import 'package:bookshelfs/tabs/homepage.dart';
import 'package:bookshelfs/tabs/orders.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showtoast(String title) =>
    Fluttertoast.showToast(msg: title, fontSize: 16);

void canceltoast() => Fluttertoast.cancel();

class Purchase_summary extends StatefulWidget {
  @override
  State<Purchase_summary> createState() => _Purchase_summaryState();
}

class _Purchase_summaryState extends State<Purchase_summary> {
  String selectedValue = "1 Week";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1 Week"), value: "1 Week"),
      DropdownMenuItem(child: Text("2 Week"), value: "2 Week"),
      DropdownMenuItem(child: Text("3 Week"), value: "3 Week"),
      DropdownMenuItem(child: Text("4 Week"), value: "4 Week"),
    ];
    return menuItems;
  }

  String initialPrice = 20.toString();
  String BookPrice = " ";

  void changemyPrice(String value) {
    switch (value) {
      case "1 Week":
        BookPrice = initialPrice;
        break;
      case "2 Week":
        BookPrice = (int.parse(initialPrice) * 2).toString();
        break;
      case "3 Week":
        BookPrice = (int.parse(initialPrice) * 3).toString();
        break;
      case "4 Week":
        BookPrice = (int.parse(initialPrice) * 4).toString();
        break;
      default:
    }
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Color.fromARGB(49, 19, 159, 219),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text(
                        " CANCEL ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "images/rich_dad.jpg",
                        height: 70,
                        width: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text("Book Title",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            "by author name",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "₹$BookPrice",
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      DropdownButton(
                          dropdownColor: Color.fromARGB(255, 203, 198, 198),
                          value: selectedValue,
                          items: dropdownItems,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value!;
                              changemyPrice(selectedValue);
                            });
                          }),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Deliver to : ",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text("Reciever Name",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 2,
                          ),
                          Text("address"),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 650,
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Get it by : ",
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              Text("day , date",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          elevation: 8,
                          shadowColor: Colors.amberAccent,
                          child:
                              Center(child: Text("Choose Your Payment Method")),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            }, // Make Function for Paytm Payment
                            child: Card(
                              elevation: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedIndex == 0
                                        ? Colors.amberAccent.withOpacity(0.3)
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    )),
                                height: 50,
                                padding: EdgeInsets.all(10),
                                width: 140,
                                child: Image.asset(
                                  "images/Paytm_Logo.png",
                                  height: 60,
                                  width: 70,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                selectedIndex = 1;
                              });
                            }),
                            child: Card(
                              elevation: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedIndex == 1
                                        ? Colors.amberAccent.withOpacity(0.3)
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    )),
                                height: 50,
                                padding: EdgeInsets.all(10),
                                width: 140,
                                child: Center(
                                    child: Text(
                                  "Cash On Delievery",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        child: Card(
                          shadowColor: Colors.amberAccent,
                          elevation: 50,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text("BookShelf logo of size 60,60"),
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                " \" The BookShelf \n is Loaded With Many \n  Exciting Books \" ",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        elevation: 5,
                        onPressed: () {
                          setState(() {
                            showtoast("Your Order Has Been Placed");
                            int i = allOrder.length;
                            i++;
                            allOrder.add(i);
                          });

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },
                        color: Colors.orangeAccent,
                        splashColor: Colors.blue,
                        child: Text("Order"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
