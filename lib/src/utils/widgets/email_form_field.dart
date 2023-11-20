import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/base_text_form_field.dart';

import 'text_view.dart';

class EmailFormField extends StatelessWidget {
  final void Function(String?, bool) onChange;
  final void Function(String)? onFieldSubmitted;

  final String? initialValue;
  final bool enabled;

  const EmailFormField({
    super.key,
    this.initialValue,
    this.onFieldSubmitted,
    required this.onChange,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          text: 'Email',
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        BaseTextFormField(
          initialValue: initialValue,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(
              Icons.person_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Uname@mail.com',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 190, 190, 190),
              fontSize: 12,
              fontFamily: 'ProductSans',
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          validator: (String? value, BuildContext context) {
            if (value == null || value.isEmpty) {
              return 'email data cannot be empty';
            }
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value)) {
              return 'please enter a valid email address';
            }
            return null;
          },
          onChanged: onChange,
        ),
      ],
    );
  }
}
