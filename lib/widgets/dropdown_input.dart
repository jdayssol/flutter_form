import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum Fruit { Apples, Oranges, Peaches }

class DropdownInput extends StatefulWidget {
  const DropdownInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  Fruit dropdownValue = Fruit.Apples;
  //var dropdownItems = <String>["Apples", "Oranges", "Peaches"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Fruit>(
      value: dropdownValue,
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: Fruit.values.map((Fruit item) {
        return DropdownMenuItem<Fruit>(
          value: item,
          child: Text(item.name),
        );
      }).toList(),
    );
  }
}
