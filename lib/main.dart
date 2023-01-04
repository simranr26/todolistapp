import 'package:flutter/material.dart';
import 'package:new1/providers/task_provider.dart';
import 'package:new1/screens/home_screen.dart';
import 'package:new1/sizes.dart';
import 'package:provider/provider.dart';

void main() => (runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: "To-do App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: Sizes.h1,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
