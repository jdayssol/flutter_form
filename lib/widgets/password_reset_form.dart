// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_form/models/passwords.dart';
import 'package:flutter_form/widgets/checkbox_form_field.dart';
import 'package:flutter_form/widgets/passwords_reset_form_field.dart';

class PasswordResetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              PasswordResetFormField(
                initialValue: Passwords('', '', 8),
                onSaved: (passwords) {
                  print("Password: ${passwords!.password}");
                },
                validator: (passwords) {
                  if (passwords!.nonEmpty()) {
                    if (passwords.match()) {
                      if (passwords.valid()) {
                        return null;
                      }
                      return "Passwords should be 8 characters long";
                    }
                    return "Passwords should be same";
                  }
                  return "Passwords should not be empty";
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              CheckboxFormField(
                title: "I agree to change password",
                onSaved: (checked) {
                  print("Checkbox: $checked");
                },
                validator: (value) {
                  return value! ? null : "You must check this";
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              )
            ],
          ),
        ),
        ElevatedButton(
          child: const Text("Reset Password"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            }
          },
        )
      ],
    );
  }
}
