import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SendModel extends ChangeNotifier {
  // Firebaseに値を保存する変数を定義する。
  final _firestore = FirebaseFirestore.instance;
  String? message; //TextFieldのvalueを入れる
  // String型の引数を書く
  Future<void> sendMessage(String value) async {
    // 上で定義した変数を呼び出して、引数を格納する
    message = value;
    // async awaitつけている以外は、StatefulWidgetの書き方をそのまま使っている。
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
    // Provider使うので、notifyListenersを書く。他のページで呼び出す時に必要!
    notifyListeners();
  }

}