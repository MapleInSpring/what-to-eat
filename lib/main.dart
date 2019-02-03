import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CollectionReference testConnection = Firestore.instance.collection(
      'test');

  @override
  Widget build(BuildContext context) {
    testConnection.document().setData({'test': 'test value'});

    return MaterialApp(
        title: 'What to eat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomeApp()
    );
  }
}


class HomeApp extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initialSettings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
        initialSettings, onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    showNotification();

    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('What to eat'),
          ),
          body: new Center(
              child: RaisedButton(
                  onPressed: showNotification,
                  child: Text('Show Notification')
              )
          )
      ),
    );
  }

  Future showNotification() async {
    var android = new AndroidNotificationDetails('channel id', 'channel name', 'channel description');
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(0, 'What did you eat?', 'meat vegi carb nuts', platform);
  }
}
