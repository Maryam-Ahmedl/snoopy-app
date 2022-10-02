import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'allwelcomepages/welcomepage.dart';
import 'firebaseauth/showmessage.dart';
import 'firebasefirestore/storeData.dart';
import 'helper_classes/text.dart';
import 'mainPage/curvied_navigation_bar.dart';
import 'package:get/get.dart';
import 'notification/controller.dart';


bool darkmode = false;
void main() async{
  AwesomeNotifications().initialize(null, [NotificationChannel(
      channelKey: 'test_channel',
      channelName: 'text',
      channelDescription: 'notification')]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserSimplePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Notification_binding(),
      scaffoldMessengerKey: messengerKey,
      debugShowCheckedModeBanner: false,
      home: Container(
        child: AnimatedSplashScreen(
          backgroundColor: Color.fromRGBO(191, 157, 157,1.0),
          splash: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_65DYreJ7ru.json",repeat: true),
          splashTransition: SplashTransition.scaleTransition,
          duration: 2000,
          splashIconSize: 200,
          nextScreen: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color: Colors.red.shade300,backgroundColor: Colors.grey.shade400,));
              }
              else if(snapshot.hasError){
                return Center(child: text("Something went wrong", Colors.red.shade300, 25));
              }
              else if(snapshot.hasData){
                return page();
              }
              else{
                return welcomepage();
              }
            },
          ),
        ),
      ),
    );
  }
}
