class Uebung{
  final String name;
  final List<Reps> saetze;

  const Uebung(
    this.name,
    this.saetze
  );
}

class Reps{
  final int gewicht;
  final int wiederholungen;
  const Reps(
    this.gewicht,
    this.wiederholungen
  );
}