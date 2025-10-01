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
        initialRoute: '/',
      onGenerateRoute: (RouteSettings settings){
          late Widget routewidget;
          if(settings.name == '/'){
          routewidget = HomeScreen();
          } else if(settings.name == '/profile'){
            routewidget = ProfileScreen();
          } else if(settings.name == '/settings'){
            routewidget = SettingScreen();
          }


          return MaterialPageRoute(builder: (context){
            return routewidget;
          });
      },


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
              //Get.to(SettingScreen());
              Get.toNamed('/settings');
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
