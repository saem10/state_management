import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.green),
      body: Center(
        child: Obx(() {
          return Text(count.toString(), style: TextStyle(fontSize: 32));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
