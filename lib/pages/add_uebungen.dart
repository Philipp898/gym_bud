import 'package:flutter/material.dart';

class AddUebungenForm extends StatefulWidget{
  final int workoutId;

   AddUebungenForm({Key? key,required this.workoutId}) : super(key: key);
   
  @override
  State<AddUebungenForm> createState() => _AddUebungenFormState();
}

class _AddUebungenFormState extends State<AddUebungenForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Füge hier deine Übungen hinzu"),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Text(widget.workoutId.toString()),
        ),
    );
  }
}