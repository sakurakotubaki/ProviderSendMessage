import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SendModel extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  String? message; //TextFieldのvalueを入れる

  Future<void> sendMessage(String value) async {
    message = value;

    await _firestore
        .collection('messages')
        .doc('document_demo')
        .set(
      {
        'text': message,
      },
    )
        .then((value) => print('ドキュメントを追加しました！'))
        .catchError((e) => print(e));
    notifyListeners();
  }

}