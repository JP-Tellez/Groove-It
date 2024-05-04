import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_it/music/music_provider.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Center(
          //   child: Text(
          //     'Details',
          //   ),
          // ),

          actions: [
            IconButton(
              icon: Icon(
                Icons.cancel,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
            ),
            Text(
              "[Name]",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.start,
            ),
            Text(
              "ID: " + context.watch<MusicProvider>().userId,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
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
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
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
                              "Personal information",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
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
                  SizedBox(height: 15),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
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
                  SizedBox(height: 15),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
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
                // Si deseas que ListTile en si tenga una acción diferente, colocarla aquí
              },
            ),
          ],
        ),
      ),
    );
  }
}
