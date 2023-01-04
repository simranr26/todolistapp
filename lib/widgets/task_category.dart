import 'package:flutter/material.dart';
import 'package:new1/models/task.dart';
import 'package:new1/providers/task_provider.dart';
import 'package:provider/provider.dart';

import 'task_item.dart';

class TaskCategory extends StatelessWidget {
  final String text;
  const TaskCategory({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    List<Task> tasks = context.watch<TaskProvider>().toDoTasks;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      constraints: BoxConstraints(minHeight: screenHeight * 0.4),
      height: tasks.isEmpty ? screenHeight * 0.4 : null,
      child: Column(
        children: [
          tasks.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text("No tasks has been added today."),
                  ),
                )
              : Column(
                  children: tasks.map((task) => TaskItem(task: task)).toList(),
                )
        ],
      ),
    );
  }
}
