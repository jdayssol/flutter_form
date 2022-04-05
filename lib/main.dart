import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/basic_form.dart';
import 'package:flutter_form/widgets/basic_form2.dart';
import 'package:flutter_form/widgets/checkbox_form_field.dart';
import 'package:flutter_form/widgets/checkbox_input.dart';
import 'package:flutter_form/widgets/dropdown_input.dart';
import 'package:flutter_form/widgets/emails_input.dart';
import 'package:flutter_form/widgets/multi_widget_form.dart';
import 'package:flutter_form/widgets/password_reset_form.dart';
import 'package:flutter_form/widgets/radio_input.dart';
import 'package:flutter_form/widgets/slider_input.dart';
import 'package:flutter_form/widgets/switch_input.dart';
import 'package:flutter_form/widgets/text_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creating Forms with Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Widgets'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //CheckboxInput(),

            //DropdownInput(),
            //EmailsInput(),
            //RadioInput(),
            //SliderInput(),
            //SwitchInput(),
            //BasicForm2(),
            //MultiWidgetForm(),
            PasswordResetForm(),
            //TextInput()
          ],
        ),
      ),
    );
  }
}
