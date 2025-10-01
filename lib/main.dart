import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: HomeScreen(),


    );
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
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
          actions: [
          IconButton(onPressed: (){
            Get.offAll(HomeScreen());
          }, icon:Icon(Icons.refresh_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return Text(count.toString(), style: TextStyle(fontSize: 32));
            }),
            TextButton(onPressed: (){
              Get.to(SettingScreen());
              //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
            }, child: Text('Go to Settings'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count ++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

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
              Get.off(ProfileScreen());
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


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(child: TextButton(onPressed: () {
        /*Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => HomeScreen()),
                (predicate) => false);*/
        Get.offAll(HomeScreen());
      },
          child: Text('Go to Home Screen')),),
    );
  }
}
