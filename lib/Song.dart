import 'package:meta/meta.dart';

final demoPlaylist = new DemoPlaylist(
  songs: [
    new DemoSong(
      audioUrl: 'http://dl.nex1music.ir/1394/12/12/Kaveh%20Afagh%20-%20Del%20[128].mp3?time=1562316895&filename=/1394/12/12/Kaveh%20Afagh%20-%20Del%20[128].mp3',
      albumArtUrl: 'http://myritm.com/Uploads/Pictures/1394-12/K/Kaveh-Afagh-Del-Picture.jpg',
      songTitle: 'Del',
      artist: 'Kaveh Afagh',
    ),
    new DemoSong(
      audioUrl: 'http://srv1.mihan.xyz/s3/nevisande/takahang/1394/03/09/Siavash%20Ghomayshi%20-%20Pooch%20%5B128%5D.mp3',
      albumArtUrl: 'https://www.my98music.com/wp-content/uploads/2015/05/Siavash-Ghomayshi-Pooch.jpg',
      songTitle: 'Pooch',
      artist: 'Siavash Ghomayshi',
    ),
    new DemoSong(
      audioUrl: 'http://dl.nex1music.ir/1398/03/08/Reza%20Yazdani%20-%20Too%20Khodam%20Misoozam%20[128].mp3?time=1562316535&filename=/1398/03/08/Reza%20Yazdani%20-%20Too%20Khodam%20Misoozam%20[128].mp3',
      albumArtUrl: 'https://nex1music.ir/upload/2019-05-29/reza-yazdani-too-khodam-misoozam-2019-05-29-21-50-43.jpg',
      songTitle: 'Misoozam',
      artist: 'Reza Yazdani',
    ),
    new DemoSong(
      audioUrl: 'http://dl.nex1music.ir/1398/04/07/Ehsan%20Khajeh%20Amiri%20-%20Paeize%20Masmoom%20[128].mp3?time=1562318943&filename=/1398/04/07/Ehsan%20Khajeh%20Amiri%20-%20Paeize%20Masmoom%20[128].mp3',
      albumArtUrl: 'https://nex1music.ir/upload/2019-06-28/ehsan-khajeh-amiri-paeize-masmoom-2019-06-28-21-20-50.jpg',
      songTitle: 'Masmoom',
      artist: 'Ehsan Khaje Amiri',
    ),
    new DemoSong(
      audioUrl: 'http://dl.mynextmelody.ir/IranMelody/Archive/E/Ebi/Ebi%20-%20Jane%20Javani/01%20Jane%20Javani.mp3',
      albumArtUrl: 'http://dl.mynextmelody.ir/IranMelody/Archive/E/Ebi/Ebi%20-%20Jane%20Javani/Ebi%20-%20Jane%20Javani.jpg',
      songTitle: 'Jane Javani',
      artist: 'Ebi',
    ),
    new DemoSong(
      audioUrl: 'http://dl.mytopseda.ir/nevisande/reza/music/9/15/Shadmehr%20Aghili%20-%20Hamishegi%20%5b128%5d.mp3',
      albumArtUrl: 'https://mytopseda.ir/wp-content/uploads/2018/11/Shadmehr-Aghili-Hamishegi.jpg',
      songTitle: 'Hamishegi',
      artist: 'Shadmehr',
    ),
    new DemoSong(
      audioUrl: 'http://dl.mydlbx.xyz/archive/persian/d/Dariush/music/128/Dariush%20Eghbali%20-%20Na%20%5B128%5D.mp3',
      albumArtUrl: 'https://www.mykohanmusic2.xyz/wp-content/uploads/2018/12/Dariush-Na.jpg',
      songTitle: 'Na',
      artist: 'Dariush',
    ),
    new DemoSong(
      audioUrl: 'https://nava.ir/wp-content/uploads/2017/04/SirvanKhosravi-Kojaei_To-192.mp3',
      albumArtUrl: 'https://nava.ir/wp-content/uploads/2017/04/SirvanKhosravi-Kojaei-To-1.jpg',
      songTitle: 'Kojayi To',
      artist: 'Sirvan Khosravi',
    ),
    new DemoSong(
      audioUrl: 'hhttp://dl.behtarmusic.com/Yas/Yas%20-%20Tak%20Ahangha%20%5B320%2C128%5D/Yas%20-%20Esalat%20%5B128%5D.mp3',
      albumArtUrl: 'https://behtarmusic.com/wp-content/uploads/2017/08/Yas-Esalat.jpg',
      songTitle: 'Esalat',
      artist: 'Yas',
    ),
    new DemoSong(
      audioUrl: 'http://dl.behtarmusic.com/Mohsen%20Yeganeh/Mohsen%20Yeganeh%20-%20Tak%20Ahangha%20%5B320%2C128%5D/Mohsen%20Yeganeh%20-%20Moohat%20%5B128%5D.mp3',
      albumArtUrl: 'https://behtarmusic.com/wp-content/uploads/2019/04/Mohsen-Yeganeh-Mohat.jpg',
      songTitle: 'Mohat',
      artist: 'Mohsen Yeganeh',
    ),
    new DemoSong(
      audioUrl: 'http://irsv.upmusics.com/Downloads/Musics/Mohsen%20Chavoshi%20-%20JorChin%20(128).mp3',
      albumArtUrl: 'https://upmusics.com/wp-content/uploads/2019/05/chavoshi.jpg',
      songTitle: 'Jor Chin',
      artist: 'Mohsen Chavoshi',
    ),
    new DemoSong(
      audioUrl: 'http://dl.azlyrics.ir/fl/Taylor-Swift/taylor-swift-bad-blood.mp3',
      albumArtUrl: 'https://azlyrics.ir/wp-content/uploads/2015/07/url.jpg',
      songTitle: 'Bad Blood',
      artist: 'Taylor Swift',
    ),
  ],
);

class DemoPlaylist {

  final List<DemoSong> songs;

  DemoPlaylist({
    @required this.songs,
  });

}

class DemoSong {

  final String audioUrl;
  final String albumArtUrl;
  final String songTitle;
  final String artist;

  DemoSong({
    @required this.audioUrl,
    @required this.albumArtUrl,
    @required this.songTitle,
    @required this.artist,
  });

}