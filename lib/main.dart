import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    var androidInitialize = const AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future _showNotification() async
  {
    var androidDetails = const AndroidNotificationDetails(
        "channelId", "Local Notification",
        channelDescription: "Notification Successfully Generated!!");
    var iosDetails = const IOSNotificationDetails();
    var generalNotificationDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);
      await localNotification.show(0, "Success",
          "Notification Successfully Generated!!", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification App"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Click button to get notification',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                  onPressed: _showNotification,
                  child: const Text('Click Me')
              )
            ],
          ),
        )
      ),
    );
  }
}

