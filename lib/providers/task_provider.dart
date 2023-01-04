import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> _toDoTasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get toDoTasks => _toDoTasks;

  late SharedPreferences prefs;

  void loadLocalData() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? datas = prefs.getStringList("Tasks");
    datas?.forEach((data) {
      Map<String, dynamic> taskData = jsonDecode(data);
      Task task = Task.fromJson(taskData);
      _tasks.add(task);
    });
    updateTasksCategories();
    notifyListeners();
  }

  void updateStorage() {
    List<String> jsonTasks = [];
    for (var task in _tasks) {
      String jsonTask = jsonEncode(task);
      jsonTasks.add(jsonTask);
    }
    prefs.setStringList("Tasks", jsonTasks);
  }

  void updateTasksCategories() {
    _toDoTasks = _tasks.where((task) => !task.isDone).toList();
  }

  void addTask(String title) {
    var newTask = Task(id: DateTime.now().toString(), title: title);
    _tasks.add(newTask);
    updateDatas();
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    updateDatas();
  }

  void toggleDone(String id) {
    int index = _tasks.indexWhere((task) => task.id == id);
    _tasks[index].isDone = !_tasks[index].isDone;
    updateDatas();
  }

  void updateDatas() {
    updateTasksCategories();
    updateStorage();
    notifyListeners();
  }
}
