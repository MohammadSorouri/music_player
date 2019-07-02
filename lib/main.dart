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
        primaryColor:Color(0xffdf223d),
        primarySwatch: Colors.red,
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
      bottomNavigationBar: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Color(0xfffbe8eb),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(icon: Icon(MdiIcons.musicCircle,size: 32,color: Color(0xffdf223d),),onPressed: (){},),
                  Text("Home",style: TextStyle(color: Color(0xffdf223d),fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.headset,color: Colors.grey,),onPressed: (){},),
            IconButton(icon: Icon(Icons.perm_identity,color: Colors.grey,),onPressed: (){},)
          ],
        ),
      ),
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
              new ListMusic1(),
              SizedBox(height: 8,),
              new ListMusic1(),
              SizedBox(height: 8,),
              new ListMusic1(),

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
          new ItemMusic(url: "http://img1.motolyrics.com/3/96/39691/siavash-ghomayshi-original.jpg", name:"Pooch" ),
          new ItemMusic(url: "https://bir-music.com/wp-content/uploads/2019/05/Reza-Yazdani-Too-Khodam-Misoozam.jpg", name: "Misoozam")

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
                height: 120,
                width: 120,
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
                    Icon(Icons.headset,color: Colors.redAccent,size: 18,),
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
      width: 120,
      height: 150,
    );
  }
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
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration:BoxDecoration(
            color: Color(0xffdf223d),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 32,right: 24,left: 24),
          width: MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            color: Color(0xfff7f7f7),
            borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
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
                    child: Icon(MdiIcons.microphoneVariant,color: Color(0xffdf223d),size: 32,),
                  ),
                  SizedBox(height: 8,),
                  Text("Singer",style: TextStyle(fontSize: 16),)
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
                    child: Icon(MdiIcons.radio,color: Color(0xffdf223d),size: 32,),
                  ),
                  SizedBox(height: 8,),
                  Text("Radio",style: TextStyle(fontSize: 16),)
                ],
              ),   Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white
                    ),
                    child: Icon(MdiIcons.playlistMusic,color: Color(0xffdf223d),size: 32,),
                  ),
                  SizedBox(height: 8,),
                  Text("Song List",style: TextStyle(fontSize: 16),)
                ],
              ),   Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white
                    ),
                    child: Icon(MdiIcons.starFourPoints,color: Color(0xffdf223d),size: 32,),
                  ),
                  SizedBox(height: 8,),
                  Text("Rank",style: TextStyle(fontSize: 16),)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

