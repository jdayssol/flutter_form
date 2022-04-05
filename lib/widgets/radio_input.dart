import 'package:flutter/material.dart';

class RadioInput extends StatefulWidget {
  const RadioInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  String radioValue = "oranges";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Apples"),
          onChanged: (value) {
            setState(() {
              radioValue = value.toString();
            });
          },
          value: "apples",
          groupValue: radioValue,
        ),
        RadioListTile(
          title: const Text("Oranges"),
          onChanged: (value) {
            setState(() {
              radioValue = value.toString();
            });
          },
          value: "oranges",
          groupValue: radioValue,
        ),
        RadioListTile(
          title: const Text("Peaches"),
          onChanged: (value) {
            setState(() {
              radioValue = value.toString();
            });
          },
          value: "peaces",
          groupValue: radioValue,
        ),
      ],
    );
  }
}
