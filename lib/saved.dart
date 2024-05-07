import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class Saved extends StatelessWidget {
  Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Center(
          //   child: Text(
          //     'Recent',
          //   ),
          // ),
          //leading: Icon(Icons.person),

          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Saved",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("You have saved X songs"),
              ),
              Expanded(child: Recent()),
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
            CardSong(),
            CardSong(),
          ],
        );
      },
    );
  }
}

class CardSong extends StatelessWidget {
  CardSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 150,
            // height: 250,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                  child: Column(
                children: [
                  Icon(
                    Icons.image,
                    size: 125,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.account_circle), Text("Song Title")],
                  )
                ],
              )),
            )));
  }
}
