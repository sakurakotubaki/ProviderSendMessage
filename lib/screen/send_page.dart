import 'package:flutter/material.dart';
import 'package:messages_app/provider/send_model.dart';
import 'package:provider/provider.dart';

class SendPage extends StatelessWidget {
  // このページでフォームの値を格納する変数がいるので、コンストラクターを定義して作る!
  SendPage(this.msgValue);
  String msgValue;

  @override
  Widget build(BuildContext context) {
    // 下でコードを短く書くために、「msg」という定数を定義しておく!
    final msg = Provider.of<SendModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // valueという引数を書く
                    onChanged: (value) {
                      // Providerで呼び出した「message」に、引数valueを格納する
                      msg.message = value;
                      // コンストラクターの変数に、Providerのmessage変数を格納する
                      msgValue = msg.message!;
                      print(msgValue);
                    },
                  ),
                ),
              ),
              TextButton(
                // 非同期処理を書く。ボタンを押すとイベントが発火して、notifyListenersが呼ばれる。
                // StatefulWidgetだと、setState(){}を書く
                  onPressed: () async {
                    // onChangedで格納した値をFireStoreへ送信する
                  await msg.sendMessage(msgValue); // コンストラクターで定義した変数を()の中に書く!
              }, child: Text('Send'))
            ],
          )
        ],
      ),
    );
  }
}