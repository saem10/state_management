import 'package:get/get.dart';

class CounterController {
  RxInt count = 0.obs;

  void increment(){
    count++;
  }
  void reset() => count.value = 0;
}