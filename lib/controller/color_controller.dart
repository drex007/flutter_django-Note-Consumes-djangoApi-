import 'package:get/get.dart';

class ColorController extends GetxController {
RxInt _mycolor = 0.obs;
RxInt get mycolor => _mycolor; 


defaultColor(){
  _mycolor = 0.obs;

}
redColor(){
  _mycolor = 1.obs;}

  pinkColor(){
  _mycolor = 2.obs;}

}