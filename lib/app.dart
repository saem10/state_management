import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/widget/controller_binder.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

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
      //initialBinding: ControllerBinder(),
    );
  }
}