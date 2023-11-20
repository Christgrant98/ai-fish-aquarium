import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/base_text_form_field.dart';

class EmailFormField extends StatelessWidget {
  final void Function(String?, bool)? onChange;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;

  final String? initialValue;
  final bool enabled;

  const EmailFormField({
    super.key,
    this.initialValue,
    this.onFieldSubmitted,
    this.onChange,
    this.enabled = true,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: controller,
      enabled: enabled,
      fieldValue: initialValue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIcon: const Icon(
          CupertinoIcons.envelope,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: 'mail@example.com',
        labelStyle: GoogleFonts.quicksand(
          color: const Color.fromARGB(255, 190, 190, 190),
          fontSize: 14,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'email data cannot be empty';
        }
        final emailRegex = RegExp(r'^[\w-zñ\.]+@([\w-zñ]+\.)+[\w-z]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'please enter a valid email address';
        }
        return null;
      },
      onChange: (String? value, bool isValid) {
        onChange!(value?.toLowerCase(), isValid);
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
