import 'package:bookshelfs/Screens/BookDetails.dart';
import 'package:bookshelfs/Screens/myDrawer.dart';
import 'package:bookshelfs/Screens/purchase_summary.dart';
import 'package:bookshelfs/Screens/tabbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var searchBar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TabController _mytabController =
        TabController(initialIndex: 0, length: 3, vsync: this);

    return Scaffold(
        drawer: myDrawer(),
        appBar: AppBar(
          title: Text("Homepage"),
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hii, moshy"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Find Your Fantasy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 60,
                        child: TextField(
                          controller: searchBar,
                          style: TextStyle(fontSize: 15),
                          keyboardType: TextInputType.text,
                          onSubmitted: (value) {
                            searchBar.text = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.red,
                                )),
                            hintText: "Search Book",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Container(
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        controller: _mytabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: "New",
                          ),
                          Tab(
                            text: "Trending",
                          ),
                          Tab(
                            text: "Best Authors",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 210,
                    child: TabBarView(
                        physics: BouncingScrollPhysics(),
                        controller: _mytabController,
                        children: tabbarview().mytabbarfun()),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      "Popular Books",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => Book(),
                          child: Card(
                            elevation: 7,
                            child: Container(
                              height: 80,
                              child: Row(
                                children: [
                                  Image.asset("images/rich_dad.jpg"),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Book name"),
                                      Text(
                                        "Author Name",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(" Price : 20")
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text("Rating : "),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Purchase_summary()));
                                    },
                                    child: Text("Order Now"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
        ));
  }
}
