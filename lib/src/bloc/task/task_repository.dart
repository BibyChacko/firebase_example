import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRepository{
  fetchTasks() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("tasks").get();
    return querySnapshot;
  }

  createNewTask(String title,String body) async{
    await FirebaseFirestore.instance.collection("tasks").add({"title":title,"body":body});
  }
}