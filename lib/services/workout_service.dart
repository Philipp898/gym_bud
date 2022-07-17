import 'package:gym_bud/models/cardio.dart';

import '../models/uebung.dart';
import 'package:gym_bud/models/workout.dart';

List<Workout> generateDummyData() {

    var uebungArme1 =
      Uebung("Bankdrücken", [Reps(40, 12), Reps(45, 12), Reps(50, 12)]);
  var uebungArme2 =
      Uebung("Butterfly", [Reps(39, 12), Reps(45, 12), Reps(54, 10)]);

  var uebungBauch2 =
      Uebung("Sit-Ups", [Reps(75, 12), Reps(75, 12), Reps(75, 12)]);

      var cardio1= Cardio(6, 30, "min");
  List<Workout> workoutList = [
    Workout(1, "Arme", DateTime(2022, 07, 16), "Philipp"),
    Workout(1, "Bauch", DateTime(2022, 07, 20), "Philipp")
  ];
  workoutList[0].uebung.add(uebungArme1);
  workoutList[0].uebung.add(uebungArme2);
  workoutList[1].uebung.add(uebungBauch2);

  workoutList[1].cardio = cardio1;
  return workoutList;
}

var workoutList = generateDummyData();

List<Workout> findAllWorkouts() {
  return workoutList;
}

void createNewWorkout(Workout workout) {
  workoutList.add(workout);
}

Workout findLastWorkout() {
  workoutList
      .sort((workout1, workout2) => workout1.datum.compareTo(workout2.datum));
  return workoutList[0];
}

Workout findWorkoutById(Workout workout) {
  return workoutList.firstWhere((wo) => wo.id == workout.id);
}

void addUebungToWorkout(Uebung uebung, Workout workout) {
  workoutList.firstWhere((wo) => wo.id == workout.id).uebung.add(uebung);
}

void removeUebungFromWorkout(Uebung uebung, Workout workout) {
  var foundUebung = workoutList
      .firstWhere((wo) => wo.id == workout.id)
      .uebung
      .firstWhere((ue) => ue.name == uebung.name);
  workoutList
      .firstWhere((wo) => wo.id == workout.id)
      .uebung
      .remove(foundUebung);
}
