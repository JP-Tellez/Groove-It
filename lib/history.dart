import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_notes_app/content/item_public.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groove_it/music/history_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter/widgets.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final notifier = HistoryProvider();

  @override
  void initState() {
    super.initState();
    notifier.getDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              'Recent',
            ),
          ),
          //leading: Icon(Icons.person),
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: notifier.musicList.length,
                itemBuilder: (context, index) {
                  final musicItem = notifier.musicList[index];
                  return ListTile(
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
                  );
                },
              ),
            ),
            // FutureBuilder(
            //     future: notifier.getDocument(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text('Error fetching history'));
            //       } else {
            //         return ListView.builder(
            //           itemCount: notifier.musicList.length,
            //           itemBuilder: (context, index) {
            //             final musicItem = Provider.of<HistoryProvider>(context)
            //                 .musicList[index];
            //             return Text(musicItem["album"]);
            //           },
            //         );
            //       }
            //     })
          ],
        ),
      ),
    );
  }
}

// class History extends StatelessWidget {
//   History({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Center(
//               child: Text(
//                 'Recent',
//               ),
//             ),
//             //leading: Icon(Icons.person),
//             actions: [
//               IconButton(
//                 icon: Icon(
//                   Icons.menu,
//                 ),
//                 onPressed: () {},
//               ),
//             ]),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "History",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Expanded(child: Recent()),
//             ],
//           ),
//         ));
//   }
// }

// class Recent extends StatelessWidget {
//   const Recent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 5,
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context, int index) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             CardSong(),
//             CardSong(),
//           ],
//         );
//       },
//     );
//   }
// }

// class CardSong extends StatelessWidget {
//   CardSong({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         child: SizedBox(
//             width: 150,
//             // height: 250,
//             child: Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Center(
//                   child: Column(
//                 children: [
//                   Icon(
//                     Icons.image,
//                     size: 125,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [Icon(Icons.account_circle), Text("Song Title")],
//                   )
//                 ],
//               )),
//             )));
//   }
// }
