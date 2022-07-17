import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_bud/models/workout.dart';
import 'package:gym_bud/services/workout_service.dart';

import 'pages/add_workout.dart';
import 'pages/workout_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [
        Locale('de'),
      ],
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
  List<Workout> workoutList = List.empty(growable: true);
  String generateGreeting() {
    var currentHour = DateTime.now().hour;
    return currentHour > 1 && currentHour <= 9
        ? "Guten Morgen Philipp"
        : currentHour > 10 && currentHour <= 18
            ? "Guten Tag Philipp"
            : "Guten Abend Philipp";
  }

  @override
  void initState() {
    workoutList = generateDummyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(generateGreeting()),
        ),
        body: WorkoutList(workoutList: workoutList),
        bottomNavigationBar: Row(
          children: <Widget>[
            ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                 await _navigateAndReturnList(context);
                }),
          ],
        ));
  }

  Future<void> _navigateAndReturnList(BuildContext context) async {
    final Workout result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddWorkoutForm()));

    if (!mounted) return;

    setState(() {
      workoutList.add(result);
    });
  }
}
