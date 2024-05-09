import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

class HistoryProvider with ChangeNotifier {
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  String userId = FirebaseAuth.instance.currentUser!.uid;
  String get getUserId => userId;
}
