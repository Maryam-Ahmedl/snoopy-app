import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_mode/add_status.dart';

class control_notification extends GetxController{

  void send_notification(){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'test_channel',
            title: "Snoopy",
            body: "hey my friend , check-mode now \n"
                "  how are you feeling today?",
            displayOnBackground: true,
            backgroundColor: Colors.grey.shade300,
            color: Colors.black
        ));

    AwesomeNotifications().actionStream.listen((event) {
     Get.to(add_status());
    });
    
  }
}