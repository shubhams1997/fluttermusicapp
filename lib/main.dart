import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:music/songpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Music",
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                TopHead(),
                RecentmusicRow(),
                SongsList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class TopHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 20, left: 10),
      alignment: Alignment.bottomLeft,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Heebo",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Recently music you played",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                      fontFamily: "Heebo",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentmusicRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 250),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          songImg("images/img1.jpg"),
          songImg("images/img2.jpg"),
          songImg("images/img3.jpg"),
          songImg("images/img4.jpg"),
          songImg("images/img5.jpg"),
        ],
      ),
    );
  }

  Widget songImg(String imageName) {
    final wordpair = WordPair.random();
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('$imageName'),
            ),
          ),
        ),
        Positioned(
          height: 250,
          width: 200,
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: [0.3, 0.5, 0.9, 1],
                colors: [
                  Color.fromRGBO(29, 70, 83, 0.7),
                  Color.fromRGBO(29, 71, 83, 0.6),
                  Color.fromRGBO(19, 51, 63, 0.1),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    wordpair.asPascalCase,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Heebo",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            debugPrint("Icon taped");
                          },
                          icon: Icon(
                            Icons.play_circle_filled,
                            size: 50,
                            color: Color.fromRGBO(30, 200, 199, 1),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Followers",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "15,9000,781",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Top Played Albums",
              style: TextStyle(
                fontFamily: "Heebo",
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                letterSpacing: 0.7,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, i) {
                return ListedSong(i);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListedSong extends StatefulWidget {
  final int i;
  ListedSong(this.i);
  @override
  _ListedSongState createState() => _ListedSongState(i);
}

class _ListedSongState extends State<ListedSong> {
  int i;
  _ListedSongState(this.i);
  final wordPair = WordPair.random();
  bool alreadySaved = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SongPage(i);
        }));
      },
      leading: Hero(
        tag: "listed-song-img$i",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset('images/thumb/$i.jpeg', scale: 3.4),
        ),
      ),
      title: Text(wordPair.asPascalCase),
      subtitle: Text("15,900,781 Played"),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              alreadySaved = false;
            } else {
              alreadySaved = true;
            }
          });
        },
        icon: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(29, 51, 65, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Icon(
                Icons.headset,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Icon(
                Icons.speaker,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
