import 'package:flutter/material.dart';

class MultiTextForm extends StatefulWidget {
  const MultiTextForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiTextForm();
}

class _MultiTextForm extends State<MultiTextForm> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Expanded(
            child: ListView(
              children: [
                TextFormField(
                  initialValue: "",
                  validator: (String? value) {
                    print("Validating name field...");
                    if (value?.isEmpty ?? false) {
                      return "Provide your name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextFormField(
                  initialValue: "",
                  validator: (String? value) {
                    print("Validating email field...");
                    var regex = RegExp(r"^[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+$");
                    if (value != null && !regex.hasMatch(value)) {
                      return "Provide a valid email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  initialValue: "",
                  maxLength: 200,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  validator: (String? value) {
                    print("Validating message field...");
                    if (value?.isEmpty ?? false) {
                      return "Input your message";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Message"),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          child: const Text("Process"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print("[INFO] Form is valid.");
            }
          },
        )
      ],
    );
  }
}
