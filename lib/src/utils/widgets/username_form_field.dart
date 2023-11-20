import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          text: 'Username',
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        BaseTextFormField(
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
              fillColor: Colors.white,
              hintText: "username123",
              hintStyle: GoogleFonts.quicksand(
                color: const Color.fromARGB(255, 190, 190, 190),
                fontSize: 14,
              ),
              labelStyle: GoogleFonts.quicksand(
                color: const Color.fromARGB(255, 190, 190, 190),
                fontSize: 14,
              ),
            ),
            onChange: onChange,
            onFieldSubmitted: onFieldSubmitted,
            validator: (value) {
              return value!.isEmpty ? "Por favor ingresa Usuario" : null;
            }),
      ],
    );
  }
}
