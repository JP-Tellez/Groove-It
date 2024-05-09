import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  String userId = FirebaseAuth.instance.currentUser!.uid;
  String get getUserId => userId;

  List<dynamic> _musicList = [];
  List<dynamic> get musicList => _musicList;

  // HistoryProvider() {
  //   getDocument();
  // }

  Future<void> getDocument() async {
    try {
      final docRef = instance.collection("history").doc(userId);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;

        _musicList = data['music'];
        notifyListeners();
      }
      //   return true;
      // } else {
      //   // return false;
      // }
    } catch (error) {
      print('Error fetching data: $error');
      // return false;
    }
  }
}
