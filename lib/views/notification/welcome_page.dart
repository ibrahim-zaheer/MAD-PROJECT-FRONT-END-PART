import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations"),
      ),
      body: Column(children: [
        Text(message.notification!.title.toString()),
        Text(message.notification!.body.toString()),
        Text(message.data.toString()),
      ]),
    );
  }
}
