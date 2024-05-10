import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:groove_it/detail_song.dart';
import 'package:groove_it/history.dart';
import 'package:groove_it/music/music_provider.dart';
import 'package:groove_it/saved.dart';

class Profile extends StatelessWidget {
  Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Center(
          //   child: Text(
          //     'Details',
          //   ),
          // ),

          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.cancel,
          //     ),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ]
          ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Groove It",
                style: TextStyle(fontSize: 50),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "${context.watch<MusicProvider>().getPhotoURL}",
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${context.watch<MusicProvider>().getName}",
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "${context.watch<MusicProvider>().getEmail}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "${context.watch<MusicProvider>().getPhone}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 25),
            Container(
              height: 1.4, // Ancho de la línea deseado
              width: 370, // Largo de la línea deseado
              color: Colors.black, // Color de la línea
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      // // Agregar aquí la función que deseas ejecutar cuando se toca el texto "Personal information"
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => DetailSong(),
                      //   ),
                      // );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 56.0,
                            alignment: Alignment.center,
                            child: Icon(Icons.person),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Details song",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 370, // Largo máximo deseado
                      height: 1.4, //  Ancho de la línea deseado
                      color: Colors.black, // Color de la línea
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Agregar aquí la función que deseas ejecutar cuando se toca el texto "Notifications"
                      print('Se tocó el texto "Notifications"');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 56.0,
                            alignment: Alignment.center,
                            child: Icon(Icons.notifications),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Notifications",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 370,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Agregar aquí la función que deseas ejecutar cuando se toca el texto "History"
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => History(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 56.0,
                            alignment: Alignment.center,
                            child: Icon(Icons.history),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "History",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 370,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Saved(),
                        ),
                      );
                      // Agregar aquí la función que deseas ejecutar cuando se toca el texto "Saved"
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 56.0,
                            alignment: Alignment.center,
                            child: Icon(Icons.favorite),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Saved",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 370,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: GestureDetector(
                onTap: () {
                  // Agregar aquí la función que se desea ejecutar cuando se toca el icono de settings
                  print('Se tocó el icono de settings');
                },
                child: Icon(Icons.settings),
              ),
              title: Text("Settings"),
              trailing: GestureDetector(
                onTap: () {
                  // Agrega aquí la función que se desea ejecutar cuando se toca el icono de la luna
                  print('Se tocó el icono de la luna');
                },
                child: Icon(Icons.nightlight_round),
              ),
              onTap: () {
                // Si deseas que ListTile en sí tenga una acción diferente, colocarla aquí
              },
            ),
          ],
        ),
      ),
    );
  }
}
