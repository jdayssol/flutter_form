import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      print("Current value is ${textController.text}");
    });
  }

  @override
  void dispose() {
    super.dispose();

    if (textController != null) {
      textController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        inputFormatters: <TextInputFormatter>[
          // We can filter the value using a regextp
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: TextInputType
            .number, // The keyboard will be reduced to the allowed character (only on mobile)
        decoration: InputDecoration(labelText: "Number"),
        maxLength: 50,
        controller:
            textController, // You can attach the text field to a controller to watch his value
        onChanged: (String value) {
          // You can also watch the state using the default function of the widget
          print("Current value is $value");
        },
      ),
    );
  }
}
