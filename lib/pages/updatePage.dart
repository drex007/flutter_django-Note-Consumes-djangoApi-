import 'package:flutter/material.dart';
import 'package:flutter_django/api/api.dart';
import 'package:flutter_django/controller/color_controller.dart';
import 'package:flutter_django/pages/myHomePage.dart';
import 'package:flutter_django/repository/notes_repo.dart';
import 'package:get/get.dart';

class UpdatePage extends StatefulWidget {
  int id;
  String body;

  UpdatePage({ Key? key, required this.id , required this.body}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
    NoteRepo notes = Get.find();
    UrlClass url = Get.find();
  ColorController colorController = Get.find();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.body;
    super.initState();
  }
 
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
                  url.editNote(widget.id, textEditingController.text);
                 
                  setState((){
                  
                  url.getData();
                
                  Get.to(()=>MyHomePage());
        
                  });
       
                }, child: Text("Update"),)


                  ],
                ),
              ),
            )
         
          ],
          
        )

      
    );
    
  }
}