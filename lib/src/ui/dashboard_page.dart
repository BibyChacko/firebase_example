
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/src/bloc/task/task_cubit.dart';
import 'package:firebase_example/src/ui/add_new_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddNewTaskPage()));
        },

      ),
      body: SafeArea(
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if(state is TaskLoading){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is TaskLoaded){
              QuerySnapshot snapshot = state.querySnapshot;
              return ListView.builder(
                  itemCount: snapshot.docs.length,
                  itemBuilder: (_,pos){
                    return ListTile(
                      title: Text("${snapshot.docs[pos].get("title")}"),
                      subtitle: Text("${snapshot.docs[pos].get("body")}"),
                    );
                  }
              );
            }else if(state is TaskLoadError){
              return Center(child: Text("${state.errorMessage}"));
            }else{
              return Container();
            }

          },
        ),
      ),

    );
  }

  void fetchTasks() {
    BlocProvider.of<TaskCubit>(context).fetchTasks();
  }
}
