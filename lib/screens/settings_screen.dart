import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),
        backgroundColor: Colors.green,),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {
              //Get.off(ProfileScreen());
              Get.offNamed('/profile');
            },
                child: Text('Go to Profile')),
            TextButton(onPressed: () {
              Get.back();
            },
                child: Text('Back')),

          ],
        ),

      ),
    );
  }
}