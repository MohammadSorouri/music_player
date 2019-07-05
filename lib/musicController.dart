import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flute_music_player/flute_music_player.dart';

class MusicController extends StatefulWidget {
  @override
  _MusicControllerState createState() => _MusicControllerState();
}
class _MusicControllerState extends State<MusicController> {
  double _value;
  void _setvalue(double value) => setState(() => _value = value);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = 0;

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(onPressed: (){},icon:Icon(Icons.more_horiz),)
        ],
      ),
      body: Column(
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            elevation: 2,
            child: Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              width: size.width,
              height: size.height*.65,
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    elevation: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: CachedNetworkImage(imageUrl: "https://www.my98music.com/wp-content/uploads/2015/05/Siavash-Ghomayshi-Pooch.jpg",width: size.width-180,height: size.width-180),
                    )
                  ),
                  SizedBox(height: size.height*.65*.03,),
                  Text("Pooch",style: TextStyle(color:Colors.black,fontSize: 18),),
                  SizedBox(height: size.height*.65*.02,),
                  Text("Siavash Ghomayshi",style: TextStyle(color:Colors.black54,fontSize: 14),),
                  SizedBox(height: size.height*.65*.055,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child:   new Slider(value: _value,onChanged: _setvalue,min: 0,max: 100,)
                  ),
                  SizedBox(height: size.height*.65*.065,),
                  Material(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(onPressed: (){print("");},icon: Icon(Icons.favorite_border,color: Colors.grey,),),
                        IconButton(onPressed: (){print("");},icon: Icon(MdiIcons.downloadOutline,color: Colors.grey,),),
                        IconButton(onPressed: (){print("");},icon: Icon(Icons.label_outline,color: Colors.grey,),),
                        IconButton(onPressed: (){print("");},icon: Icon(Icons.chat_bubble_outline,color: Colors.grey,),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          new Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             IconButton(icon: Icon(Icons.skip_previous,size: 32,), onPressed: (){},color: Colors.white,),
             SizedBox(width: 40,),
            Material(
             borderRadius: BorderRadius.all(Radius.circular(50)),
              elevation: 3,
              child: Container(
              width: 56,
                height: 56,
                child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(50)),child: MaterialButton(
                  onPressed: (){
                },
                height: 56,
                minWidth: 56,
                highlightElevation: 1,
                 child: Container(child: Icon(Icons.play_arrow,color: Colors.amber,size: 24,)),)),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      ),
                      ),
              SizedBox(width: 40,),
              IconButton(icon: Icon(Icons.skip_next,size: 32,), onPressed: (){},color: Colors.white,),

    ],
    ),
    )
        ],
      ),
      backgroundColor: Colors.amberAccent,
    );
  }


}



