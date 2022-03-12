import 'package:flutter/material.dart';
import 'package:flutter_django/api/api.dart';
import 'package:flutter_django/controller/color_controller.dart';
import 'package:flutter_django/pages/myHomePage.dart';
import 'package:flutter_django/repository/notes_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dependencies/deps.dart' as dep;
void main()  async {
   WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: (){
        return  GetMaterialApp(
        debugShowCheckedModeBanner : false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
 
      },
        );
  }
}
