import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petapp/Views/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:petapp/services/notification_service.dart'; // Import the GetX package

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.toString());
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyBQ26M9Ra0dsY3FgJXbVr_B4KlQ5kZFE8s" , appId: "1:226765294736:android:c64c6df309579864fbdc15", messagingSenderId: "226765294736", projectId: "ueeapp-4e0ca" ,  storageBucket: "gs://ueeapp-4e0ca.appspot.com")
    );
    LocalNotificationService.initialize();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp( MyApp());//gamindu
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//tharuka
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        ),

      title: 'Flutter Demo',
      home:OnBoardingScreen(),


    );
  }
}

