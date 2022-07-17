import 'package:flutter/material.dart';
import 'package:gym_bud/models/workout.dart';
import 'package:gym_bud/services/workout_service.dart';


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
                    kategorieInput.selection = TextSelection.fromPosition(TextPosition(offset: kategorieInput.text.length));
                  });
                },
              ),
              ElevatedButton(
                onPressed: (){
                  _selectDate(context);
                }, 
                child: const Text("Wähle deinen Trainingstag")),
              Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var workout = Workout(DateTime.now().microsecond, kategorieInput.text, selectedDate, "Philipp");
                      //createNewWorkout(workout);
                      Navigator.pop(context,workout);
                    }
                  },
                  child: const Text('Weiter zu den Übungen'),
                ),
              ),
            ],
          )),
          )
    );
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
