import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:state_management/fcm_message_service.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmMessageService().initialize();
  print(await FcmMessageService().getFcmToken());
  FcmMessageService().onTokenRefresh();
  runApp(MyApp());
}

