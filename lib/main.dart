import 'package:flutter/material.dart';

import 'pages/workout_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Bud',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String generateGreeting() {
    var currentHour = DateTime.now().hour;
    return currentHour > 1 && currentHour <= 9
        ? "Guten Morgen Philipp"
        : currentHour > 10 && currentHour <= 18
            ? "Guten Tag Philipp"
            : "Guten Abend Philipp";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(generateGreeting()),
      ),
      body: const WorkoutList(),
    );
  }
}

