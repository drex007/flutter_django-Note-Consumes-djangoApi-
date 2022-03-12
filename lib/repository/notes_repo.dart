import 'package:flutter_django/model/model_notes.dart';
import 'package:get/get.dart';

class NoteRepo extends GetxController {
RxList  _noteList = [].obs;
RxList get noteList => _noteList;



}