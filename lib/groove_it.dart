import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_it/music/music_provider.dart';

class Groove_It extends StatefulWidget {
  @override
  Groove_It_S createState() => Groove_It_S();
}

class Groove_It_S extends State<Groove_It> {
  ACRCloudResponseMusicItem? music;
  @override
  void initState() {
    super.initState();
    ACRCloud.setUp(ACRCloudConfig(
        "7335e78fed37c3b3bce7131e11f10937",
        "two6B9YVKBoskQDSiPUxWAWs9OpJLsCCkJ8S2ITL",
        "identify-us-west-2.acrcloud.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Find a Song',
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
                onPressed: () async {
                  setState(() {
                    music = null;
                  });

                  final session = ACRCloud.startSession();

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: Text('Listening...'),
                      content: StreamBuilder(
                        stream: session.volumeStream,
                        initialData: 0,
                        builder: (_, snapshot) =>
                            Text(snapshot.data.toString()),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: session.cancel,
                        )
                      ],
                    ),
                  );

                  final result = await session.result;
                  Navigator.pop(context);

                  if (result == null) {
                    // Cancelled.
                    return;
                  } else if (result.metadata == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('No result.'),
                    ));
                    return;
                  } else {
                    setState(() {
                      music = result.metadata!.music.first;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Track: ${music!.title}\n'
                          "Artist: ${music!.artists.first.name}"),
                    ));
                    context.read<MusicProvider>().addSongToHistory(music!);
                  }
                },
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
