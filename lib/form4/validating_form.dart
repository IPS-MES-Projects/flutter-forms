import 'package:flutter/material.dart';

class ValidatingForm extends StatefulWidget {
  const ValidatingForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValidatingFormState();
}

class _ValidatingFormState extends State<ValidatingForm> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: TextFormField(
            initialValue: "",
            validator: (String? value) {
              print("Validator called: $value");
              if (value?.isEmpty ?? false) {
                return "Provide a value";
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        ElevatedButton(
          child: const Text("Process"),
          onPressed: () {
            formKey.currentState!.validate();
          },
        )
      ],
    );
  }
}
