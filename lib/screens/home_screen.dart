import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/counter_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              counterController.reset();
              Get.snackbar(
                "Counter Reset",
                "The counter has been reset to 0",
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 1),
              );
            },
            icon: Icon(Icons.refresh_outlined),
            tooltip: "Reset Counter", // shows label on long press
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder(
                  init: counterController,
                  builder: (controller){
                    return Text(
                      controller.count.toString(),
                      style: TextStyle(fontSize: 32),
                    );
              }),
              TextButton(onPressed: (){
                Get.toNamed('/settings');
              }, child: Text('Go to Settings'))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}