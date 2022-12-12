import 'package:flutter/material.dart';

class SwitchInput extends StatefulWidget {
  const SwitchInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SwitchInputState();
}

class _SwitchInputState extends State<SwitchInput> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Title for the Switch"),
      value: switchState,
      onChanged: (bool value) {
        setState(() {
          switchState = value;
        });
      },
    );
  }
}
