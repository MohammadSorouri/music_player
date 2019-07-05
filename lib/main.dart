import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Song.dart';
import 'color.dart';
import 'header.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import 'music.dart';


void main() => runApp(MyApp());

final Widget placeholder = Container(color: Colors.grey);

final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicPlayer',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: primary,
        fontFamily: "Quicksand"
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  startTimeout() {
    var duration = Duration(milliseconds: 5000);
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {  // callback function
    setState(() {
    });
    startTimeout();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimeout();
  }
  @override
  Widget build(BuildContext context) {
    var image = AudioApp.albumArtUrl;
    // TODO: implement build
    return Scaffold(

      bottomNavigationBar:
          BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(MdiIcons.musicCircle,),title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold),)),
            BottomNavigationBarItem(icon: Icon(Icons.headset,),title: Text("My Music")),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline,),title: Text("Account")),
          ]),

      backgroundColor: Color(0xfff7f7f7),
      body:Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: MediaQuery.of(context).size.width*.75,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          new SearchBar(),
                          new Microfon(),

                        ],
                      ),
                      new CarouselWithIndicatorHead(),

                    ],
                  ),
                ),

              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  new ItemList(),
                  new Popular(),
                  new ListMusic1(),
                  SizedBox(height: 8,),
                  new ListMusic2(),
                  SizedBox(height: 8,),
                  new ListMusic3(),
                  SizedBox(height: 8,),
                  new ListMusic4(),
                  SizedBox(height: 24,),

                ]),
              )
            ],
          ),
          InnerDrawer(child: AudioApp(), scaffold: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Stack(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                            color: Colors.white,
                          ),
                          width: 88,
                          height: 64,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 4,top: 4,bottom:4,right: 28),
                              child:Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: AudioApp.albumArtUrl,fit: BoxFit.cover,)),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topLeft: Radius.circular(30)),
                        child: MaterialButton(
                          onPressed: (){_open();},
                          height: 64,
                          minWidth: 88,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ), position: InnerDrawerPosition.end,animationType: InnerDrawerAnimation.linear,offset: 1,key: _innerDrawerKey,)
        ],
      )
    );
  }

}
void _open()
{
  _innerDrawerKey.currentState.open();
}

void _close()
{
  _innerDrawerKey.currentState.close();
}
class ListMusic1 extends StatelessWidget {
  const ListMusic1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DemoPlaylist _playlist = demoPlaylist;
    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           ItemMusic(name: _playlist.songs[0].songTitle,url: _playlist.songs[0].albumArtUrl,c: context,artist: _playlist.songs[0].artist,urlm: _playlist.songs[0].audioUrl,id: 0),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[1].songTitle,url: _playlist.songs[1].albumArtUrl,c: context,artist: _playlist.songs[1].artist,urlm: _playlist.songs[1].audioUrl,id: 1),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[2].songTitle,url: _playlist.songs[2].albumArtUrl,c: context,artist: _playlist.songs[2].artist,urlm: _playlist.songs[2].audioUrl,id: 2),

        ],
      ),
    );
  }
}
class ListMusic2 extends StatelessWidget {
  const ListMusic2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DemoPlaylist _playlist = demoPlaylist;

    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ItemMusic(name: _playlist.songs[3].songTitle,url: _playlist.songs[3].albumArtUrl,c: context,artist: _playlist.songs[3].artist,urlm: _playlist.songs[3].audioUrl,id: 3),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[4].songTitle,url: _playlist.songs[4].albumArtUrl,c: context,artist: _playlist.songs[4].artist,urlm: _playlist.songs[4].audioUrl,id: 4),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[5].songTitle,url: _playlist.songs[5].albumArtUrl,c: context,artist: _playlist.songs[5].artist,urlm: _playlist.songs[5].audioUrl,id: 5),

        ],
      ),
    );
  }
}
class ListMusic3 extends StatelessWidget {
  const ListMusic3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DemoPlaylist _playlist = demoPlaylist;

    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ItemMusic(name: _playlist.songs[6].songTitle,url: _playlist.songs[6].albumArtUrl,c: context,artist: _playlist.songs[6].artist,urlm: _playlist.songs[6].audioUrl,id: 6),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[7].songTitle,url: _playlist.songs[7].albumArtUrl,c: context,artist: _playlist.songs[7].artist,urlm: _playlist.songs[7].audioUrl,id: 7),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[8].songTitle,url: _playlist.songs[8].albumArtUrl,c: context,artist: _playlist.songs[8].artist,urlm: _playlist.songs[8].audioUrl,id: 8),

        ],
      ),
    );
  }
}
class ListMusic4 extends StatelessWidget {
  const ListMusic4({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DemoPlaylist _playlist = demoPlaylist;

    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ItemMusic(name: _playlist.songs[9].songTitle,url: _playlist.songs[9].albumArtUrl,c: context,artist: _playlist.songs[9].artist,urlm: _playlist.songs[9].audioUrl,id: 9),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[10].songTitle,url: _playlist.songs[10].albumArtUrl,c: context,artist: _playlist.songs[10].artist,urlm: _playlist.songs[10].audioUrl,id: 10),
          SizedBox(width: 8,),
          ItemMusic(name: _playlist.songs[11].songTitle,url: _playlist.songs[11].albumArtUrl,c: context,artist: _playlist.songs[11].artist,urlm: _playlist.songs[11].audioUrl,id: 11),

        ],
      ),
    );
  }
}

Stack ItemMusic({  String url, String name,BuildContext c,String artist,String urlm,int id}) {
    return Stack(
      children: <Widget>[

    Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Column(
    children: <Widget>[
    Stack(
    alignment: Alignment.bottomLeft,
    children: <Widget>[
    ClipRRect(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
    child: CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    width:  height(c),
    height:  height(c),
    ),
    ),
    Container(
    width: 56,
    height: 20,
    decoration: BoxDecoration(color: Colors.black54,
    borderRadius: BorderRadius.only(topRight: Radius.circular(5))
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Icon(Icons.headset,color: accent,size: 18,),
    Text("15W",style: TextStyle(color:Colors.white),maxLines: 1,),
    ],
    ),
    )
    ],
    ),
    SizedBox(height: 3,),
    Text(name,style: TextStyle(fontSize: 16),maxLines: 1,)
    ],
    ),
    width: height(c),
    height: height(c)+30,
    ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Container(
              width: height(c),
              height: height(c)+30,
            ),
            minWidth: height(c),
            height: height(c)+30,
            onPressed: (){AudioApp.id =id ;AudioApp.artist=artist;AudioApp.albumArtUrl=url;AudioApp.songTitle=name;AudioAppState.stop();AudioApp.kUrl= urlm;AudioAppState.play();_open();},
          ),
        ),
      ],
    );
  }

  double height(BuildContext context) => (MediaQuery.of(context).size.width-48)/3;


class Popular extends StatelessWidget {
  const Popular({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Popular",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          FilterChip(label: Text("More"), onSelected: (v){})
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 32,right: 24,left: 24),
          width: MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            color: Color(0xfff7f7f7),
            borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new CircleBotton(icon: MdiIcons.microphoneVariant,name: "Singer",),
              new CircleBotton(icon: MdiIcons.radio,name: "Radio",),
              new CircleBotton(icon: MdiIcons.playlistMusic,name: "Song List",),
              new CircleBotton(icon: MdiIcons.starFourPoints,name: "Rank",),
              //           new CircleBotton(),
   //           new CircleBotton(),
            ],
          ),
        )
      ],
    );
  }
}

class CircleBotton extends StatelessWidget {
  IconData icon;
  String name;
  CircleBotton({@required this.name,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white
              ),
              child: Icon(icon,color: accent,size: 24,),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: MaterialButton(
                minWidth: 56,
                height: 56,
                padding: EdgeInsets.all(0),
                child: Container(height: 56,width: 56,),
                onPressed: (){print("");},
              ),
            )
          ],
        ),
        SizedBox(height: 8,),
        Text(name,style: TextStyle(fontSize: 14),)
      ],
    );
  }
}

