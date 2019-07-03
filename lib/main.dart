import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'header.dart';


void main() => runApp(MyApp());

final Widget placeholder = Container(color: Colors.grey);




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicPlayer',
      theme: ThemeData(
        primarySwatch: Colors.amber,
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(MdiIcons.musicCircle,),title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold),)),
            BottomNavigationBarItem(icon: Icon(Icons.headset,),title: Text("My Music")),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline,),title: Text("Account"))
          ]),

      backgroundColor: Color(0xfff7f7f7),
      body: CustomScrollView(
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
    );
  }

}

class ListMusic1 extends StatelessWidget {
  const ListMusic1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new ItemMusic(name: "Del",url: "http://myritm.com/Uploads/Pictures/1394-12/K/Kaveh-Afagh-Del-Picture.jpg",),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://www.my98music.com/wp-content/uploads/2015/05/Siavash-Ghomayshi-Pooch.jpg", name:"Pooch" ),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://bir-music.com/wp-content/uploads/2019/05/Reza-Yazdani-Too-Khodam-Misoozam.jpg", name: "Misoozam")

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
    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new ItemMusic(name: "Zemestoon",url: "http://dl.irhits.ir/Single/1396/09%20-%20Azar/30/Aria%20Band%20-%20Zemestoon.jpg",),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://d2uqwoe9jzxxtn.cloudfront.net/images/music/cover/Ebi_Jane-Javani_1419049746.jpg", name:"Jane Javani" ),
          SizedBox(width: 8,),
          new ItemMusic(url: "http://barf-music.com/wp-content/uploads/Shadmehr-Aghili-Hamishegi.jpg", name: "Hamishegi")

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
    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new ItemMusic(name: "Na",url: "https://images.sk-static.com/images/media/profile_images/artists/520028/huge_avatar",),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://www.ganja2music.com/Image/Post/12.2014/Sirvan%20Khosravi%20-%20Kojaei%20To.jpg", name:"Kojaei" ),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://ahaang.com/wp-content/uploads/2015/12/%DB%8C%D8%A7%D8%B3.jpg", name: "Asalatََ")

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
    return Padding(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new ItemMusic(name: "Vabastegi",url: "https://i1.sndcdn.com/artworks-000239199195-3gq4bt-t500x500.jpg",),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://upmusics.com/wp-content/uploads/2017/11/mohsen-chavoshi-hamkhaab.jpg", name:"Hamkhab" ),
          SizedBox(width: 8,),
          new ItemMusic(url: "https://upload.wikimedia.org/wikipedia/en/9/9b/Taylor_Swift_Feat._Kendrick_Lamar_-_Bad_Blood_%28Official_Single_Cover%29.png", name: "Bad Blood")

        ],
      ),
    );
  }
}
class ItemMusic extends StatelessWidget {
  String url;
  String name;
   ItemMusic({@required this.url,@required this.name}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                height: height(context),
                width: height(context),
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
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
                    Icon(Icons.headset,color: Colors.amberAccent,size: 18,),
                    Text("15W",style: TextStyle(color:Colors.white),),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 3,),
          Text(name,style: TextStyle(fontSize: 16),)
        ],
      ),
      width: height(context),
      height: height(context)+30,
    );
  }

  double height(BuildContext context) => (MediaQuery.of(context).size.width-48)/3;
}

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
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white
                    ),
                    child: Icon(MdiIcons.microphoneVariant,color: Colors.amberAccent,size: 24,),
                  ),
                  SizedBox(height: 8,),
                  Text("Singer",style: TextStyle(fontSize: 14),)
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white
                    ),
                    child: Icon(MdiIcons.radio,color: Colors.amberAccent,size: 24,),
                  ),
                  SizedBox(height: 8,),
                  Text("Radio",style: TextStyle(fontSize: 14),)
                ],
              ),   Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white
                    ),
                    child: Icon(MdiIcons.playlistMusic,color: Colors.amberAccent,size: 24,),
                  ),
                  SizedBox(height: 8,),
                  Text("Song List",style: TextStyle(fontSize: 14),)
                ],
              ),   Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white
                    ),
                    child: Icon(MdiIcons.starFourPoints,color: Colors.amberAccent,size: 24,),
                  ),
                  SizedBox(height: 8,),
                  Text("Rank",style: TextStyle(fontSize: 14),)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

