

import 'package:firebase_example/src/bloc/task/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewTaskPage extends StatefulWidget {
  const AddNewTaskPage({Key? key}) : super(key: key);

  @override
  _AddNewTaskPageState createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Enter title"
                ),
                validator: (value){
                  if((value??'').isEmpty){
                    return 'Please enter a valid text';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: bodyController,
                decoration: InputDecoration(
                    labelText: "Enter body"
                ),
                validator: (value){
                  if((value??'').isEmpty){
                    return 'Please enter a valid text';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 8,),
              ElevatedButton(
                  onPressed: () {
                      String title = titleController.text;
                      String body = bodyController.text;
                      BlocProvider.of<TaskCubit>(context).addNewTask(title, body);
                      Navigator.pop(context);
                  },
                  child: Text("Add New Task")
              )
            ],
          ),
        ),
      )
    );
  }
}
