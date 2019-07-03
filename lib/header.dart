import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
final List<String> imgList = [
  'https://persianfa.com/wp-content/uploads/2019/01/Ebi_s_new_album6.jpg',
  'https://headlineplanet.com/home/wp-content/uploads/2017/08/Taylor-Swift-Reputation-758x426.jpg',
  'https://financialtribune.com/sites/default/files/styles/telegram/public/field/image/17january/12_kaveh.jpg?itok=UQ4BBU4D',
  'https://lastfm-img2.akamaized.net/i/u/ar0/955de48e45a34d8d9eeebaf63e6716a5.jpg',
  'http://mag.charkhoneh.com/wp-content/uploads/2018/10/bemani2-557x330.jpg',
  'https://metalheadzone.com/wp-content/uploads/2019/03/metallica-2017-new-lineup.jpg'
];
class CarouselWithIndicatorHead extends StatelessWidget {
  const CarouselWithIndicatorHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Column(children: [
            CarouselWithIndicator(),
          ])),
    );
  }
}

class Microfon extends StatelessWidget {
  const Microfon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48,right: 16),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(icon: Icon(MdiIcons.microphoneOutline,color: Colors.white,size: 24,), onPressed: (){})),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16,right: 70,top: 48),
        child: Container(
          height: 46,
          padding: EdgeInsets.only(left: 24,top: 2),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(30)
          ),
          child: TextField(
            autofocus: false,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white,fontSize: 16),
            decoration: InputDecoration(
                hintText: "Search for",
                hintStyle: TextStyle(color:Colors.white.withOpacity(.7)),
                icon: Icon(MdiIcons.cloudSearch,color: Colors.white,size: 24,),
                border: InputBorder.none
            ),
          ),
        )
    );
  }
}
class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter,children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              imgList,
                  (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Colors.white.withOpacity(.9)
                          : Colors.white.withOpacity(.4)),
                );
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0,height: 250,),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                decoration: BoxDecoration(

                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Container()
            ),
          ),
        ]),
      ),
    );
  },
).toList();
List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}