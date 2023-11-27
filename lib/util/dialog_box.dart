import 'package:flutter/material.dart';
import 'package:project1/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task"
            ),
          ),

          //button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //save butoon
            MyButton(text: "Save", onPressed: onSave),
            const SizedBox(width: 8),
            //cancel button
            MyButton(text: "Cancel", onPressed: onCancel),
          ])
        ])
      )
    );
  }
}