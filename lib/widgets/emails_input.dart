import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailsInput extends StatefulWidget {
  const EmailsInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailsInput();
}

class _EmailsInput extends State<EmailsInput> {
  bool match = false;
  String email = "";
  String confirmEmail = "";

  final _formKey = GlobalKey<FormState>();

  void checkEmails() {
    if (email.isNotEmpty && confirmEmail.isNotEmpty && email == confirmEmail) {
      setState(() {
        match = true;
      });
    } else {
      setState(() {
        match = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) => EmailValidator.validate(value!)
                ? null
                : "Please enter a valid email",
            decoration: const InputDecoration(labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String email) {
              setState(() {
                this.email = email;
              });
              checkEmails();
            },
          ),
          TextFormField(
            validator: (value) => EmailValidator.validate(value!)
                ? null
                : "Please enter a valid email",
            decoration: const InputDecoration(labelText: "Confirm Email"),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String email) {
              setState(() {
                confirmEmail = email;
              });
              checkEmails();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              (_formKey.currentState != null &&
                      _formKey.currentState!.validate() &&
                      match)
                  ? "Email addresses match and are correct!"
                  : "Email addresses do not match",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          ElevatedButton(
            child: const Text("Continue"),
            onPressed: match
                ? () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Proceeding..."),
                          action: SnackBarAction(
                            label: "Okay",
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
