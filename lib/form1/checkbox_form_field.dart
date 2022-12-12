import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {Key? key,
      String title = "",
      required FormFieldSetter<bool> onSaved,
      required FormFieldValidator<bool> validator,
      bool initialValue = false,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<bool> state) {
              return Column(
                children: [
                  CheckboxListTile(
                      title: Text(title),
                      value: state.value,
                      onChanged: (bool? value) {
                        state.didChange(value);
                      }),
                  state.hasError
                      ? Text(
                          state.errorText.toString(),
                          style: const TextStyle(color: Colors.red),
                        )
                      : Container()
                ],
              );
            });
}
