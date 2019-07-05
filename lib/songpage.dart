import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SongPage extends StatelessWidget {
  final int i;
  SongPage(this.i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.grey,
        child: Column(
          children: <Widget>[
            Container(
              height: 280,
              // color: Colors.orange,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: SongTopHeader(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SongInfo(i),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height - 370,
              child: ListView(
                children: <Widget>[
                  SongsList(),
                  // SongsList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class SongTopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.only(bottomRight: Radius.elliptical(150, 60)),
        color: Color.fromRGBO(27, 48, 61, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 29,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Dommy Text with some length",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Heebo",
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    categoryDisplay("Pop Punk"),
                    categoryDisplay("Rock"),
                    categoryDisplay("Pop"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryDisplay(String value) {
    return Expanded(
      child: Text(
        value,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[350],
        ),
      ),
    );
  }
}

class SongInfo extends StatelessWidget {
  final int i;
  SongInfo(this.i);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // color: Colors.blue,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(),
            constraints: BoxConstraints(
              maxHeight: 320,
              maxWidth: 150,
            ),
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/thumb/$i.jpeg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  followerinfo("Followers", "15,100,901"),
                  followerinfo("Monthly Listener", "59,101"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 15),
                child: Icon(
                  Icons.play_circle_filled,
                  size: 50,
                  color: Colors.tealAccent[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget followerinfo(String value1, String value2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.all(2.0),
          child: Text(
            value1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(2.0),
          child: Text(
            value2,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
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
            constraints: BoxConstraints(maxHeight: 350),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, i) {
                return ListedSong();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListedSong extends StatefulWidget {
  @override
  _ListedSongState createState() => _ListedSongState();
}

class _ListedSongState extends State<ListedSong> {
  final wordPair = WordPair.random();
  bool alreadySaved = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Icon(
          Icons.play_circle_outline,
          size: 40,
        ),
      ),
      title: Text(wordPair.asPascalCase),
      subtitle: Text("Album name and other details"),
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
      height: 90,
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
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Song Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Details about song",
                    style: TextStyle(
                      color: Colors.grey[350],
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Icon(
              Icons.pause_circle_outline,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
