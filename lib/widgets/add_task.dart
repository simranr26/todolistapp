import 'package:flutter/material.dart';
import 'package:new1/providers/task_provider.dart';
import 'package:new1/sizes.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submit() {
    final inputTitle = _titleController.text;
    if (formKey.currentState!.validate()) {
      context.read<TaskProvider>().addTask(inputTitle);
      Navigator.pop(context);
    }
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Add a New Task",
              style: TextStyle(fontSize: Sizes.h2, fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            key: formKey,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Add New Task"),
              controller: _titleController,
              validator: (task) {
                if (task!.isEmpty) {
                  return "Task cannot be empty";
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text("Add Task"),
          )
        ],
      ),
    );
  }
}
