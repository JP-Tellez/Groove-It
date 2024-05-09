import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailSong extends StatelessWidget {
  final String album;
  final String artist;
  final String imageURL;
  final String song;
  final String spotiURL;

  DetailSong({
    super.key,
    required this.album,
    required this.artist,
    required this.imageURL,
    required this.song,
    required this.spotiURL,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Center(
            //   child: Text(
            //     'Details',
            //   ),
            // ),
            //leading: Icon(Icons.person),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cancel,
                ),
                onPressed: () {},
              ),
            ]),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        song,
                        style: TextStyle(fontSize: 45),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.network(
                      imageURL,
                      height: 300,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      artist,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Album: $album",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () async {
                    Uri url = Uri.parse(spotiURL);
                    if (!await launchUrl(url,
                        mode: LaunchMode.externalApplication)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Could not launch ${url}')));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Open in Spotify"),
                    ],
                  ))
            ],
          ),
        ));
  }
}
