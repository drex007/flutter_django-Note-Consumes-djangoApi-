import 'package:flutter_django/api/api.dart';
import 'package:flutter_django/controller/color_controller.dart';
import 'package:flutter_django/repository/notes_repo.dart';
import 'package:get/get.dart';
Future<void> init() async {
  // NoteRepo 
Get.lazyPut(()=>NoteRepo());
//UrlControllers 
Get.lazyPut(() => UrlClass());
// Product Controller
Get.lazyPut(() => ColorController());
}