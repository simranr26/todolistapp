import 'package:flutter/material.dart';
import 'package:new1/models/task.dart';
import 'package:new1/providers/task_provider.dart';
import 'package:new1/sizes.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          value: task.isDone,
          activeColor: Colors.grey,
          onChanged: (_) {
            context.read<TaskProvider>().toggleDone(task.id);
          }),
      title: Text(
        task.title,
        style: const TextStyle(
            color: Color.fromARGB(255, 136, 131, 131),
            decorationThickness: 2,
            fontSize: Sizes.b1,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {
          context.read<TaskProvider>().removeTask(task.id);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
