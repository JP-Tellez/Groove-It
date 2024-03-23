import 'package:flutter/material.dart';

class DetailSong extends StatelessWidget {
  DetailSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Center(
            //   child: Text(
            //     'Details',
            //   ),
            // ),
            leading: Icon(Icons.person),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cancel,
                ),
                onPressed: () {},
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Song Name",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.start,
              ),
              Icon(
                Icons.photo,
                size: 300,
              ),
              Text(
                "Lyrics",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Share"),
                    ],
                  ))
            ],
          ),
        ));
  }
}
