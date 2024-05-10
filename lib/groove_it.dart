import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_it/detail_song.dart';
import 'package:groove_it/music/music_provider.dart';
import 'package:groove_it/profile.dart';

class Groove_It extends StatefulWidget {
  @override
  Groove_It_S createState() => Groove_It_S();
}

class Groove_It_S extends State<Groove_It> {
  Map<String, dynamic> music = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> song = context.watch<MusicProvider>().song;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Find a Song',
            ),
            leading: IconButton(
              icon: Icon(Icons.person),
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()))
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {},
              ),
            ]),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      label: Text("Search")),
                ),
              ),
              SizedBox(height: 72),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        title: Text("Hold on! We're listening..."),
                      ),
                    );
                    bool success;
                    success = await context.read<MusicProvider>().RecordAudio();
                    Navigator.pop(context);

                    if (success == false) return;

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        title: Text("We're fetching that song for you..."),
                      ),
                    );
                    Map<String, dynamic> song;
                    (success, song) =
                        await context.read<MusicProvider>().songManager();
                    Navigator.pop(context);
                    print(
                        'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                    print(song);
                    if (song["result"] == null) success = false;
                    if (success == false) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('No result.'),
                      ));
                      return;
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text('Track: ${song["result"]["title"]}\n'
                      //       "Artist: ${song["result"]['artist']}\n"
                      //       'Album: ${song["result"]['album']}'),
                      // ));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailSong(
                              album: song["result"]["title"],
                              artist: song["result"]["artist"],
                              imageURL: song["result"]["spotify"]["album"]
                                  ["images"][1]["url"],
                              song: song["result"]["title"],
                              spotiURL: song["result"]["spotify"]
                                  ["external_urls"]["spotify"])));
                      return;
                    }
                  },
                  elevation: 3.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow_outlined,
                    size: 88.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ),
              SizedBox(height: 72),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Recent",
              //       style: TextStyle(fontSize: 36),
              //     )
              //   ],
              // ),
              // Expanded(child: Recent())
            ],
          ),
        ));
  }
}

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
                child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                            child: Text("I am a Recent Song Place Holder"))))),
            Card(
                child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                            child: Text("I am a Recent Song Place Holder"))))),
          ],
        );
      },
    );
  }
}
