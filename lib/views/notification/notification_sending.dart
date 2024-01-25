import 'package:api_demo/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:api_demo/views/notification/welcome_page.dart';
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title:  ${message.notification?.title}');
//   print('body:  ${message.notification?.body}');
//   print('data:  ${message.data}');
// }

class FireBaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("hello fuck");
    print("Token:    $fCMToken");
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    navigatorkey.currentState?.pushNamed('/welcome_screen', arguments: message);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
