import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Groove_It extends StatelessWidget {
  Groove_It({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text(
                'Find a Song',
              ),
            ),
            leading: Icon(Icons.person),
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
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.play_arrow_outlined,
                  size: 88.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 72),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(fontSize: 36),
                  )
                ],
              ),
              Expanded(child: Recent())
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
