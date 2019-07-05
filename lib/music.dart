import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

typedef void OnError(Exception exception);
var kUrl = "http://srv1.mihan.xyz/s3/nevisande/takahang/1394/03/09/Siavash%20Ghomayshi%20-%20Pooch%20%5B128%5D.mp3";


enum PlayerState { stopped, playing, paused }
var size ;
class AudioApp extends StatefulWidget {

  static var albumArtUrl = "https://www.my98music.com/wp-content/uploads/2015/05/Siavash-Ghomayshi-Pooch.jpg";
  static var songTitle = "Pooch";
  static var artist = "Siavash Ghomayshi";
  @override
  AudioAppState createState() => new AudioAppState();
}

class AudioAppState extends State<AudioApp> {

  Duration duration;
  static Duration position;

 static MusicFinder audioPlayer;

  String localFilePath;

  static PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    startTimeout();
  }
  startTimeout() {
    var duration = Duration(milliseconds: 200);
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {  // callback function
    setState(() {
    });
    startTimeout();
  }
  Future initAudioPlayer() async {
    audioPlayer = new MusicFinder();
    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print(e.toString());
    }

    print(songs);
    audioPlayer.setDurationHandler((d) => setState(() {
      duration = d;
    }));

    audioPlayer.setPositionHandler((p) => setState(() {
      position = p;
    }));

    audioPlayer.setCompletionHandler(() {
      onComplete();
      setState(() {
        position = duration;
      });
    });

    audioPlayer.setErrorHandler((msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = new Duration(seconds: 0);
        position = new Duration(seconds: 0);
      });
    });

    setState(() {
      print(songs.toString());
    });
  }

  static Future play({String url ="http://srv1.mihan.xyz/s3/nevisande/takahang/1394/03/09/Siavash%20Ghomayshi%20-%20Pooch%20%5B128%5D.mp3"}) async {
    kUrl = url;
    final result = await audioPlayer.play(kUrl);
    if (result == 1)

        print('_AudioAppState.play... PlayerState.playing');
        playerState = PlayerState.playing;

  }

  Future _playLocal() async {
    final result = await audioPlayer.play(localFilePath, isLocal: true);
    if (result == 1) setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) setState(() => playerState = PlayerState.paused);
  }

 static Future stop() async {
    final result = await audioPlayer.stop();
    if (result == 1)

        playerState = PlayerState.stopped;
        position = new Duration();

  }

  Future mute(bool muted) async {
    final result = await audioPlayer.mute(muted);
    if (result == 1)
      setState(() {
        isMuted = muted;
      });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return _buildPlayer();

  }

  Widget _buildPlayer() => Scaffold(
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
                      child: CachedNetworkImage(imageUrl: AudioApp.albumArtUrl,width: size.width-180,height: size.width-180),
                    )
                ),
                SizedBox(height: size.height*.65*.03,),
                Text(AudioApp.songTitle,style: TextStyle(color:Colors.black,fontSize: 18),),
                SizedBox(height: size.height*.65*.02,),
                Text(AudioApp.artist,style: TextStyle(color:Colors.black54,fontSize: 14),),
                SizedBox(height: size.height*.65*.055,),
                Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child:   Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: duration == null
                          ? new Slider(value: 0, onChanged: (v){})
                          : new Slider(
                          value: position?.inMilliseconds?.toDouble() ?? 0,
                          onChanged: (double value) =>
                              audioPlayer.seek((value / 1000).roundToDouble()),
                          min: 0.0,
                          max: duration.inMilliseconds.toDouble()),
                    ),
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
                    onPressed:  isPlaying ? ()=> pause() : () => play(),
                    height: 56,
                    minWidth: 56,
                    highlightElevation: 1,
                    child: Container(child: Icon(isPlaying?Icons.pause:Icons.play_arrow,color: Colors.amber,size: 24,)),)),
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
