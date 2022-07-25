import 'package:flutter/material.dart';
import 'package:gym_bud/models/workout.dart';
import 'package:gym_bud/services/workout_service.dart';

import 'add_uebungen.dart';

class AddWorkoutForm extends StatefulWidget {
  const AddWorkoutForm({Key? key}) : super(key: key);

  @override
  State<AddWorkoutForm> createState() => _AddWorkoutFormState();
}

class _AddWorkoutFormState extends State<AddWorkoutForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController kategorieInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" Erstelle ein neues Workout"),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: kategorieInput,
                    decoration: const InputDecoration(
                      hintText: "Kategorie",
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return "Dieses Feld muss gefüllt sein";
                      }
                      return null;
                    }),
                    onChanged: (value) {
                      setState(() {
                        kategorieInput.text = value.toString();
                        kategorieInput.selection = TextSelection.fromPosition(
                            TextPosition(offset: kategorieInput.text.length));
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: ElevatedButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: const Text("Wähle deinen Trainingstag")),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}"),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var id = DateTime.now().microsecond;
                          var workout = Workout(id,
                              kategorieInput.text, selectedDate, "Philipp");
                          createNewWorkout(workout);
                          await _navigateToUebungenList(context,id);
                          Navigator.pop(context, workout);
                        }
                      },
                      child: const Text('Weiter zu den Übungen'),
                    ),
                  ),
                ],
              )),
        ));
  }

  Future<void> _navigateToUebungenList(BuildContext context, int workoutId) async {
      final Workout result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddUebungenForm(workoutId: workoutId)));

      if (!mounted) return;

      setState(() {
        workoutList.add(result);
      });
    }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      helpText: "Wann soll das Training stattfinden ?",
      cancelText: "Abbrechen",
      locale: const Locale("de"),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
