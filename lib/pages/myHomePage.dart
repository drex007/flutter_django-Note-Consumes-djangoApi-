import 'package:flutter/material.dart';
import 'package:flutter_django/api/api.dart';
import 'package:flutter_django/controller/color_controller.dart';
import 'package:flutter_django/model/model_notes.dart';
import 'package:flutter_django/pages/createPage.dart';
import 'package:flutter_django/pages/updatePage.dart';
import 'package:flutter_django/repository/notes_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({ Key? key }) : super(key: key);


  @override


  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
UrlClass urls = Get.find();
ColorController colorController = Get.find();
NoteRepo notes = Get.find();

   
   late final Client client;
 
  @override
  void initState() {
    super.initState();
    urls.getData();

    
  }
   


 
 
  Widget build(BuildContext context) {
  
  
   


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:colorController.mycolor== 0?Colors.black:colorController.mycolor==1?Colors.red:Colors.pink,
          title: Text("Note Api"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only( right: 20.0),
              child: InkWell(
                onTap: (){
              Get.to(()=>CreatePage());
              setState(() {
                
              });

                },
                child: Icon(Icons.add, size: 35 ),
                

              ),
            )
          ],
    
        ),
         body:notes.noteList == 0? Center(child: CircularProgressIndicator(
           backgroundColor: Colors.black,
         )) : ListView(
          children:[
            Container(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                   
                  colorController.defaultColor();
                  setState(() {
                    
                  });
                    

                  
                  },style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),), child: Text("Default")),
                  ElevatedButton(onPressed: (){
                    colorController.redColor();
                    setState(() {
                      
                    });

                  },style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),), child: Text("Red")
                    ),
                    ElevatedButton(onPressed: (){
                      colorController.pinkColor();
                      setState(() {
                        
                      });
                   
                  
                  },style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),), child: Text("Pink")),
        
        
                ],
              ),
            ),
              
            Obx((){

              return  ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: notes.noteList.length,
                  itemBuilder: (_, index) {
                      
                      
                       return  Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                height:70.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:colorController.mycolor== 0?Colors.black:colorController.mycolor==1?Colors.red:Colors.pink,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(notes.noteList[index].body.toString(), style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    Row(children: [
                             Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>UpdatePage(id: notes.noteList[index].id,body: notes.noteList[index].body,));
                          print(notes.noteList[index].id);
                           
                        },
                        child: Icon(Icons.edit, color: Colors.white,)),
                    ),
                    SizedBox(width:15.w)
,
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: GestureDetector(
                        onTap: (){
                            urls.deleteData(notes.noteList[index].id!);
                            setState(() {
                              SnackBar(content: Text("You deleted a Note")); 
                            });
                        },
                        child: Icon(Icons.delete, color: Colors.white,)),
                    )
              
                    ],)
                     
                     
                         ],
                ),
               
              );
              
                   
            
                }
                );
           
            }

             
            ), 
           
       

          ]
          
        ) ,   
         
          
      
      ),
    );
  }
}