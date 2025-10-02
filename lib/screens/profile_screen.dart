import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(child: TextButton(onPressed: () {
        //Get.offAll(HomeScreen());
        Get.offAllNamed('/');
      },
          child: Text('Go to Home Screen')),),
    );
  }
}