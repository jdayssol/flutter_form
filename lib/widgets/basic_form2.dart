import 'package:flutter/material.dart';

class BasicForm2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BasicForm2State();
}

class _BasicForm2State extends State<BasicForm2> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      print("Validator called: $value");
                      if (value!.isEmpty) {
                        return "Provide a value";
                      }
                    },
                    onSaved: (value) {
                      print("Value: '$value'");
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  )
                ],
              )),
          ElevatedButton(
            child: const Text("Process"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }
            },
          )
        ],
      ),
    );
  }
}
