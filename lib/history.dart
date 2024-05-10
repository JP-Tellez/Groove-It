import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groove_it/detail_song.dart';
import 'package:groove_it/music/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // final notifier = HistoryProvider();
  final MusicProvider _musicProvider = MusicProvider();

  @override
  void initState() {
    super.initState();
    _musicProvider.getDocument();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<MusicProvider>().getDocument();
    return Scaffold(
      appBar: AppBar(
          // title: Center(
          //   child: Text(
          //     'Recent',
          //   ),
          // ),
          // //leading: Icon(Icons.person),
          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.menu,
          //     ),
          //     onPressed: () {},
          //   ),
          // ]
          ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Recent",
              style: TextStyle(fontSize: 50),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: context.watch<MusicProvider>().getmusicList.length,
                itemBuilder: (context, index) {
                  final reversedIndex =
                      context.watch<MusicProvider>().getmusicList.length -
                          index -
                          1;
                  final musicItem = context
                      .watch<MusicProvider>()
                      .getmusicList[reversedIndex];
                  return Card(
                    child: ListTile(
                      title: Text(musicItem["song"]),
                      leading: Image.network(
                        musicItem["imageURL"],
                        height: 100,
                      ),
                      subtitle: Text(musicItem["artist"]),
                      trailing: IconButton(
                        onPressed: () async {
                          Uri url = Uri.parse(musicItem["spotiURL"]);
                          if (!await launchUrl(url,
                              mode: LaunchMode.externalApplication)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Could not launch ${url}')));
                          }
                        },
                        icon: Icon(Icons.music_note),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailSong(
                                album: musicItem["album"],
                                artist: musicItem["artist"],
                                imageURL: musicItem["imageURL"],
                                song: musicItem["song"],
                                spotiURL: musicItem["spotiURL"])));
                      },
                    ),
                  );
                },
              ),
              // FutureBuilder(
              //     future: _musicProvider.getDocument(),
              //     builder: (context, snapshot) {
              //       if (!snapshot.hasData) {
              //         return Center(child: CircularProgressIndicator());
              //       } else if (snapshot.hasError) {
              //         return Center(
              //             child: Text('Error fetching history'));
              //       } else {
              //         return ListView.builder(
              //           itemCount: _musicProvider.getmusicList.length,
              //           itemBuilder: (context, index) {
              //             final musicItem =
              //                 _musicProvider.getmusicList[index];
              //             return Text(musicItem["album"]);
              //           },
              //         );
              //       }
              //     })
            ),
          ],
        ),
      ),
    );
  }
}
