import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base_text_form_field.dart';

class UsernameFormField extends StatelessWidget {
  final void Function(String?, bool)? onChange;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;

  const UsernameFormField({
    super.key,
    this.onChange,
    this.initialValue,
    this.onFieldSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
        controller: controller,
        fieldValue: initialValue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: const Icon(
            CupertinoIcons.person,
            color: Colors.grey,
          ),
          filled: true,
          labelText: "Usuario",
          fillColor: Colors.white,
          hintText: "username123",
          labelStyle: GoogleFonts.quicksand(
            color: const Color.fromARGB(255, 190, 190, 190),
            fontSize: 14,
          ),
        ),
        onChange: onChange,
        onFieldSubmitted: onFieldSubmitted,
        validator: (value) {
          return value!.isEmpty ? "Por favor ingresa Usuario" : null;
        });
  }
}
