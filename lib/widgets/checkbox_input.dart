import 'package:flutter/material.dart';

class CheckboxInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckboxInputState();
}

class _CheckboxInputState extends State<CheckboxInput> {
  bool checkbox1 = false;
  bool checkbox2 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CheckboxListTile(
            title: const Text("Checkbox 1"),
            value: checkbox1,
            onChanged: (value) {
              setState(() {
                checkbox1 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Checkbox 2"),
            value: checkbox2,
            onChanged: (value) {
              setState(() {
                checkbox2 = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
