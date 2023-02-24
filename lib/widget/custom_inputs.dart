import 'package:flutter/material.dart';

class CustomInput {
  static InputDecoration decoration({
    String? labeltext,
    double borderRadius = 5,
    bool enabled = true,
  }) {
    return InputDecoration(
      isDense: true,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      labelText: labeltext,
      enabled: enabled,
      filled: true,
      fillColor: !enabled ? Colors.yellow[200] : Colors.white,
    );
  }
}
