import 'package:flutter/material.dart';
import 'package:messages_app/provider/send_model.dart';
import 'package:provider/provider.dart';

class SendPage extends StatelessWidget {
  SendPage(this.msgValue);
  String msgValue;

  @override
  Widget build(BuildContext context) {
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
                    onChanged: (value) {
                      msg.message = value;
                      msgValue = msg.message!;
                      print(msgValue);
                    },
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                  await msg.sendMessage(msgValue);
              }, child: Text('Send'))
            ],
          )
        ],
      ),
    );
  }
}