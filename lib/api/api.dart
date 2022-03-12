import 'dart:convert';

import 'package:flutter_django/model/model_notes.dart';
import 'package:flutter_django/repository/notes_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class UrlClass extends GetxController{


String  getUri = "https://myflutterdjango.herokuapp.com/notes/";
String createUri = "https://myflutterdjango.herokuapp.com/notes/create/";



NoteRepo notelist = Get.find();

void getData() async{
  final url = Uri.parse(getUri);
  final response = await http.get(url);
  notelist.noteList.clear();

  if( response.statusCode == 200) {
     var data = json.decode(response.body);
     notelist.noteList.clear();
     for(var notes in data) {
        notelist.noteList.add(Notes.fromJson(notes));
     }
     
   
    // notelist.noteList.add(notesModel);
  
    
  
    print(notelist.noteList);
    print("Success");
  } else{
    print("Error + ${response.statusCode}");
  }

}

void postData(String bodyData) async{
  var postdata = await http.post(Uri.parse(createUri), body: {'body': bodyData});
  update();
 
}
void deleteData(int id)  async {
  var deleteNote = await http.delete(Uri.parse("https://myflutterdjango.herokuapp.com/notes/${id}/delete"),);
 
  getData();
  update();

}
void editNote(int id, String bodyData) async {
  var editNote = await http.put(Uri.parse("https://myflutterdjango.herokuapp.com/notes/${id}/update"), body: {'body': bodyData});
  getData();
  update();
}
void deleteNotes(){
 notelist.noteList.clear();
}


}

