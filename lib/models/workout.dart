import 'package:gym_bud/models/cardio.dart';
import 'package:gym_bud/models/uebung.dart';

class Workout {
  final int id ;
  final String nutzer;
  final String kategorie;
  final DateTime datum;
  bool beendet = false;
  List<Uebung> uebung = List.empty(growable: true);
  Cardio? cardio;

  Workout(
    this.id,
    this.kategorie,
    this.datum ,
    this.nutzer,
  );
}

