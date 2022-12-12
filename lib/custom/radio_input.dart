import 'package:flutter/material.dart';

class RadioInput extends StatefulWidget {
  const RadioInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  String radioValue = "apples";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Apples"),
          onChanged: (String? value) {
            setState(() {
              radioValue = value ?? "";
            });
          },
          value: "apples",
          groupValue: radioValue,
        ),
        RadioListTile(
          title: const Text("Oranges"),
          onChanged: (String? value) {
            setState(() {
              radioValue = value ?? "";
            });
          },
          value: "oranges",
          groupValue: radioValue,
        ),
        RadioListTile(
          title: const Text("Peaches"),
          onChanged: (String? value) {
            setState(() {
              radioValue = value ?? "";
            });
          },
          value: "peaces",
          groupValue: radioValue,
        ),
      ],
    );
  }
}
