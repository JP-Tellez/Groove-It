import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

class MusicProvider with ChangeNotifier {
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  final String audioName = "MyAudio.m4a";
  String? audioPath = '';

  String userId = FirebaseAuth.instance.currentUser!.uid;
  String get getUserId => userId;

  Map<String, dynamic> _song = {};
  Map<String, dynamic> get song => _song;

  String _resAsString = '';

  List<dynamic> _musicList = [];
  List<dynamic> get getmusicList => _musicList;

  String? _email = FirebaseAuth.instance.currentUser!.email;
  String? get getEmail => _email;

  String? _name = FirebaseAuth.instance.currentUser!.displayName;
  String? get getName => _name;

  String? _photoUrl = FirebaseAuth.instance.currentUser!.photoURL;
  String? get getPhotoURL => _photoUrl;

  String? _phone = FirebaseAuth.instance.currentUser!.phoneNumber;
  String? get getPhone => _phone;

  Future<List<dynamic>> getDocument() async {
    final docRef = instance.collection("history").doc(userId);
    final docSnapshot = await docRef.get();
    List<dynamic> elHistorial = [];

    if (docSnapshot.exists) {
      final data = docSnapshot.data()!;

      _musicList = data['music'];
      elHistorial = data['music'];
      notifyListeners();
    }
    return elHistorial;
  }

  Future<bool> RecordAudio() async {
    final record = AudioRecorder();

    Directory? dir = await getExternalStorageDirectory();

    if (await record.hasPermission()) {
      print('Starting recording');

      await record.start(const RecordConfig(), path: '${dir!.path}/$audioName');
    }

    await Future.delayed(const Duration(seconds: 4))
        .then((X) async => {audioPath = await record.stop()});

    print('AudioPath: ' + audioPath!);
    //var posibleGoodBytes = base64Encode(
    //record.convertBytesToInt16(await File(audioPath!).readAsBytes()));
    //print(posibleGoodBytes);
    record.dispose();
    return true;
  }

  Future<String> makeBase64() async {
    try {
      // print(audioPath!);
      File file = File(audioPath!);
      List<int> fileBytes = await file.readAsBytes();
      String base64String = base64Encode(fileBytes);
      return base64String;
    } catch (e) {
      print(e.toString());

      return '';
    }
  }

  Future<(bool, Map<String, dynamic>)> songManager() async {
    String base64 = await makeBase64();
    String a = await fetchSong(base64);
    // print(base64);
    a = a;
    // print(a);
    if (_song['result'] == '')
      return (false, _song);
    else
      addSongToHistory();
    return (true, _song);
  }

  Future<String> fetchSong(String base64) async {
    final uri = Uri.parse("https://api.audd.io/");
    var request = http.MultipartRequest("POST", uri);

    // Parametros
    request.fields['api_token'] =
        "187170ed16d52e34395067ca0f61ade7"; // Ingresar token de audD.io
    request.fields['return'] = "apple_music,spotify";
    request.fields['audio'] = base64;

    var response = await request.send(),
        responseString = await response.stream.bytesToString();
    _song = jsonDecode(responseString);
    _resAsString = responseString;
    // print(_song);
    notifyListeners();
    return responseString;
  }

  //Triggers adding a song to Firestore,
  //will decide if a new register needs to be created, or will update an existing one
  Future<bool> addSongToHistory() async {
    var success = true;
    var doc = await instance.collection("history").doc(userId).get();
    if (doc.exists) {
      success = await updateMusicEntry();
    } else {
      success = await createNewMusicEntry();
    }
    notifyListeners();
    return success;
  }

  //Creates a new register/doc in firestore, using the userID as the doc ID for easy access
  Future<bool> createNewMusicEntry() async {
    Map<String, dynamic> item = Map.castFrom(json.decode(_resAsString));
    if (item["status"] != "success") return false;
    Map<String, dynamic> music = item['result'];
    Map<String, dynamic> newItem = {
      //Defines song map from music elem
      "artist": music["artist"],
      "song": music["title"],
      "album": music["album"],
      "time": Timestamp.now().toDate().toString(),
      "imageURL": music["spotify"]["album"]["images"][1]["url"],
      "spotiURL": music["spotify"]["external_urls"]["spotify"]
    };
    item = {
      //Defines doc to be posted
      "id": userId,
      "music": [newItem],
    };
    try {
      instance //posts doc
          .collection("history")
          .doc(userId)
          .set(item);
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      _song = {};
      _resAsString = '';
      notifyListeners();
      return false;
    }
  }

  //Updates history array of logged user, keeping previous records
  Future<bool> updateMusicEntry() async {
    Map<String, dynamic> item = Map.castFrom(json.decode(_resAsString));
    if (item["status"] != "success") return false;
    Map<String, dynamic> music = item['result'];
    Map<String, dynamic> newItem = {
      //Defines song map from music elem
      "artist": music["artist"],
      "song": music["title"],
      "album": music["album"],
      "time": Timestamp.now().toString(),
      "imageURL": music["spotify"]["album"]["images"][1]["url"],
      "spotiURL": music["spotify"]["external_urls"]["spotify"]
    };
    try {
      var doc = instance.collection("history").doc(userId);
      final docSnapshot = await doc.get();

      if (docSnapshot.exists) {
        List<dynamic> listMusic = docSnapshot.data()!["music"];
        // print(
        //     "AAAAAAAAAAAAAAAAAAAAAAAAAAAALENGTH${listMusic.length}${listMusic[listMusic.length - 1]}AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ");
        if (listMusic.length >= 15) {
          listMusic.removeAt(0);
        }
        listMusic.add(newItem);
        // print(
        //     "AAAAAAAAAAAAAAAAAAAAAAAAAAAALENGTH${listMusic.length}${listMusic[listMusic.length - 1]}AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ");
        instance.collection("history").doc(userId).update({"music": listMusic});
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      _song = {};
      _resAsString = '';
      notifyListeners();
      return false;
    }
  }
}
