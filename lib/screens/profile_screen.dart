import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/counter_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CounterController>(
              builder: (controller) {
                return Text(
                  controller.count.toString(),
                  style: TextStyle(fontSize: 32),
                );
              },
            ),
            TextButton(
              onPressed: () {
                //Get.offAll(HomeScreen());
                Get.offAllNamed('/');
              },
              child: Text('Go to Home Screen'),
            ),
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
