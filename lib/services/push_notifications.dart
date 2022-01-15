import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
//     _fcm.configure(
// //      this callback is used when the app runs on the foreground
//         onMessage: handleOnMessage,
// //        used when the app is closed completely and is launched using the notification
//         onLaunch: handleOnLaunch,
// //        when its on the background and opened using the notification drawer
//         onResume: handleOnResume);

    //replace on Message
      FirebaseMessaging.onMessage.listen((event) {
        print("=== data = ${event.data.toString()}");
      });

    //replace on resume
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("=== data = ${event.data.toString()}");
    });

    //replace on launch
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      print("=== data = ${value?.data.toString()}");
    });

  }

  Future handleOnMessage(Map<String, dynamic> data) async {
    print("=== data = ${data.toString()}");
  }

  Future handleOnLaunch(Map<String, dynamic> data) async {
    print("=== data = ${data.toString()}");
  }

  Future handleOnResume(Map<String, dynamic> data) async {
    print("=== data = ${data.toString()}");
  }
}
