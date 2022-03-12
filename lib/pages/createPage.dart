import 'package:flutter/material.dart';
import 'package:flutter_django/api/api.dart';
import 'package:flutter_django/controller/color_controller.dart';
import 'package:flutter_django/pages/myHomePage.dart';
import 'package:flutter_django/repository/notes_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CreatePage extends StatefulWidget {
  
  const CreatePage({ Key? key, }) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  UrlClass url = Get.find();
  NoteRepo notes = Get.find();
  ColorController colorController = Get.find();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:colorController.mycolor== 0?Colors.black:colorController.mycolor==1?Colors.red:Colors.pink,
          title: Text("Note Api"),
          centerTitle: true,
    
        ),
        body:ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       TextField(
                  controller: textEditingController,
                  maxLines: 10,
                ),
                ElevatedButton(onPressed: (){
                 
                  setState((){
                  url.postData(textEditingController.text);
                  url.getData();
                  Get.to(()=>MyHomePage());
                  
                  });
   
                }, child: Text("Create A Note"),)


                  ],
                ),
              ),
            )
         
          ],
          
        )

      
    );
  }
}