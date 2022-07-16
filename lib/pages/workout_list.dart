import 'package:flutter/material.dart';
import 'package:gym_bud/models/workout.dart';
import 'package:intl/intl.dart';

import '../services/workout_service.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  List<Workout> workoutList = generateDummyData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workoutList.length,
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          // ignore: prefer_const_constructors
          Divider(
            height: 5.0,
          ),
          ListTile(
              leading: workoutList[i].beendet
                  ? const Icon(Icons.done)
                  : const Icon(Icons.close),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    workoutList[i].kategorie,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("dd.MM.yyyy").format(workoutList[i].datum),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Anzahl an Übungen: ${workoutList[i].uebung.length}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                      if(workoutList[i].cardio != null) const Icon(Icons.run_circle_outlined),
                    ],
                  )))
        ],
      ),
    );
  }
}
