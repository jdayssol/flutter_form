// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

enum Fruit { Apples, Oranges, Peaches }

class BasicForm extends StatefulWidget {
  const BasicForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) {
                    print("Value: '$value'");
                  },
                ),
                TextFormField(
                  onSaved: (value) {
                    print("Value: '$value'");
                  },
                ),
                TextFormField(
                  initialValue: "Hi",
                  onSaved: (value) {
                    print("Value: '$value'");
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Provide a value.";
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                    value: Fruit.Apples,
                    items: Fruit.values.map((Fruit item) {
                      return DropdownMenuItem<Fruit>(
                        value: item,
                        child: Text(item.name),
                      );
                    }).toList(),
                    onSaved: (value) {
                      print("onSaved DropdownButtonFormField: '$value'");
                    },
                    onChanged: (value) {
                      print("onChange DropdownButtonFormField: '$value'");
                    }),
              ],
            )),
        ElevatedButton(
          child: const Text("Continue"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print(formKey.currentState);
              formKey.currentState!.save();
            }
          },
        )
      ],
    );
  }
}
