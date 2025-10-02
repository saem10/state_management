import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/counter_controller.dart';

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
            GetBuilder<CounterController>(
                builder: (controller){
                  return Text(
                    controller.count.toString(),
                    style: TextStyle(fontSize: 32),
                  );
                }),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}