

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_notification/Notification_Services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 NotificationServices notificationServices = NotificationServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);

      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Flutter Notifications')),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){


            // notificationServices.getDeviceToken().then((value)async{
            //   var data = {
            //     'priority': 'high',
            //     'data': <String, dynamic>{
            //       'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            //       'status': 'done',
            //       "title": 'title',
            //       "body": 'body',
            //     },
            //     'notification': {
            //       "title": 'title',
            //       "body": 'body',
            //       "android_channel_id": "dbfood"
            //     },
            //     "to" : value.toString(),
            //   };
            //   await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            //       headers: <String, String>{
            //         'Content-Type': 'application/json; charset=UTF-8',
            //         'Authorization': 'key=AAAAU9Lgttw:APA91bHYsa-K8NSyj_t7QYmNScsevaLFAY66I-AjnhePaTt9exBplGVDyvVCL0W22h1cZnBQ5b-BCnA1qzXrBSyl3OsTI0-PKNLTuGyci9mi_pEYkgSROHeiKqlQLcpdJS21Eu68SHr7',
            //       },
            //       body: jsonEncode(data)
            //   ).then((value){
            //     print(value.body.toString());
            //     print(value.statusCode.toString());
            //   }).onError((error, stackTrace){
            //     print(error.toString());
            //     print(error.toString());

            //   });
            // });

            // notificationServices.getDeviceToken().then((value) async {{
            //   print(value.toString());
            //   Map data =  {
            //     "message":{
            //       "token" :  value.toString(),
            //       "priority": "high",
            //       "mutable_content": true,
            //       "notification":{
            //         "title":"FCM Message",
            //         "body":"This is an FCM notification message!",
            //       }
            //     }
            //   };
            //   var response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            //       body: json.encode(data),
            //       headers: {
            //         'Content-Type': 'application/json' ,
            //         'Authorization': 'key=AAAAU9Lgttw:APA91bHYsa-K8NSyj_t7QYmNScsevaLFAY66I-AjnhePaTt9exBplGVDyvVCL0W22h1cZnBQ5b-BCnA1qzXrBSyl3OsTI0-PKNLTuGyci9mi_pEYkgSROHeiKqlQLcpdJS21Eu68SHr7'
            //       }
            //   );
            //
            //   print(response.statusCode.toString());
            // }
            // });

          },
          child: Text('Send'),
        ),
      ),
    );
  }
}
