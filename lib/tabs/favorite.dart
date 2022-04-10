import 'package:bookshelfs/Screens/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Screens/myDrawer.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "My Favs",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  itemCount: 12,
                  itemBuilder: (context, ind) {
                    String bookTitle = "";
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Book()));

                        // Book().setfunc(bookTitle);
                      },
                      child: Card(
                        elevation: 4,
                        child: Column(
                          children: [
                            Container(
                                height: 150,
                                width: 140,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset(
                                    "images/rich_dad.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Price :"),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
