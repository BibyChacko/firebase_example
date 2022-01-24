import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_example/src/bloc/task/task_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  TaskRepository repository = TaskRepository();

  fetchTasks() async{
    emit(TaskLoading());
    try{
      QuerySnapshot querySnapshot = await repository.fetchTasks();
      emit(TaskLoaded(querySnapshot));
    }catch(ex){
      emit(TaskLoadError('Failed to load data'));
    }
  }

  addNewTask(String title,String body) async{
    await repository.createNewTask(title, body);
    fetchTasks();
  }
}
