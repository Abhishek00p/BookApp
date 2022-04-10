import 'package:bookshelfs/Screens/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:bookshelfs/Screens/purchase_summary.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

List allOrder = <int>[];

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: SafeArea(
          child: Container(
        child: allOrder.length == 0
            ? Center(
                child: Text("No Orders Have been Made Yet "),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          " \" We are Glad to provide servies to \n \b \b You , Keep BrainStorming \"",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Your all Recent Orders ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 2.0,
                      color: Colors.black,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: allOrder.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Card(
                              elevation: 2,
                              shadowColor: Colors.orange,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "images/rich_dad.jpg",
                                    width: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("BookTitle"),
                                      Text("Author Name $index")
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Purchased Date"),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 1,
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                  ],
                ),
              ),
      )),
    );
  }
}
