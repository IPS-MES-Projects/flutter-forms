import 'package:flutter/material.dart';

class EmailsInput extends StatefulWidget {
  const EmailsInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailsInput();
}

class _EmailsInput extends State<EmailsInput> {
  bool match = false;
  String email = "";
  String confirmEmail = "";

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
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: "Email"),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String email) {
            setState(() {
              this.email = email;
            });
            checkEmails();
          },
        ),
        TextField(
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
            match ? "Email addresses match!" : "Email addresses do not match",
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        ElevatedButton(
          child: const Text("Continue"),
          onPressed: match
              ? () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Proceeding..."),
                      action: SnackBarAction(
                        label: "Okay",
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              : null,
        ),
      ],
    );
  }
}
