import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({Key? key}) : super(key: key);

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

    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(labelText: "Name"),
      maxLength: 50,
      controller: textController,
    );
  }
}
