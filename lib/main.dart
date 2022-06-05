import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messages_app/provider/send_model.dart';
import 'package:messages_app/screen/send_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Firebase Smaple",
      home: ChangeNotifierProvider<SendModel>(
        create: (context) => SendModel(),
        child: SendPage(''),
      ),
    );
  }
}


