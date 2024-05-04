import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicProvider with ChangeNotifier {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<bool> addSongToHistory(ACRCloudResponseMusicItem music) async {
    var success = true;
    var doc = await FirebaseFirestore.instance
        .collection("history")
        .doc(userId)
        .get();
    if (doc.exists) {
      success = await updateMusicEntry(music);
    } else {
      success = await createNewMusicEntry(music);
    }

    return success;
  }

  Future<bool> createNewMusicEntry(ACRCloudResponseMusicItem music) async {
    Map<String, dynamic> item = {};
    Map<String, dynamic> song = {
      "artist": music.title,
      "song": music.artists.first.name,
      "album": music.album.name,
      "time": Timestamp.now().toString()
    };
    item = {
      "id": userId,
      "music": [song],
    };
    try {
      await FirebaseFirestore.instance
          .collection("history")
          .doc(userId)
          .set(item);
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateMusicEntry(ACRCloudResponseMusicItem music) async {
    Map<String, dynamic> song = {
      "artist": music.title,
      "song": music.artists.first.name,
      "album": music.album.name,
      "time": Timestamp.now().toString()
    };

    try {
      await FirebaseFirestore.instance
          .collection("history")
          .doc(userId)
          .update({
        "music": FieldValue.arrayUnion([song])
      });
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      notifyListeners();
      return false;
    }
  }
}
