import 'package:flutter/material.dart';
import 'package:flutter_forms/form1/passwords.dart';

class PasswordResetFormField extends FormField<Passwords> {
  PasswordResetFormField({
    Key? key,
    required FormFieldSetter<Passwords> onSaved,
    required FormFieldValidator<Passwords> validator,
    Passwords? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<Passwords> state) {
              return Column(
                children: [
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                    onChanged: (String value) {
                      state.value?.password = value;
                      state.didChange(state.value);
                    },
                  ),
                  TextField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: "Confirm Password"),
                    onChanged: (String value) {
                      state.value?.confirmPassword = value;
                      state.didChange(state.value);
                    },
                  ),
                  state.hasError
                      ? Text(
                          state.errorText ?? "",
                          style: const TextStyle(color: Colors.red),
                        )
                      : Container()
                ],
              );
            });
}
