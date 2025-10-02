import 'package:get/get.dart';
import 'package:state_management/widget/counter_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
     Get.put(CounterController());
    //Get.lazyPut(()=> CounterController());
  }
}