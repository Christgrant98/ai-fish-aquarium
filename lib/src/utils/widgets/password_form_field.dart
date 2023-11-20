import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

import 'base_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final void Function(String? value, bool valid) onChange;
  final Function? additionalValidator;
  final String? emptyMessage;
  final String? labelText;
  final void Function(String)? onFieldSubmitted;

  const PasswordFormField({
    Key? key,
    required this.onChange,
    this.additionalValidator,
    this.emptyMessage,
    this.labelText,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  PasswordFormFieldState createState() => PasswordFormFieldState();
}

class PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          text: 'Password',
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        BaseTextFormField(
          decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                  color: Colors.black,
                  obscureText ? Icons.visibility : Icons.visibility_off),
            ),
            contentPadding: const EdgeInsets.all(10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.labelText ?? 'Ingrese su password',
            filled: true,
            fillColor: Colors.white,
            labelStyle: GoogleFonts.quicksand(
              color: const Color.fromARGB(255, 190, 190, 190),
              fontSize: 14,
            ),
          ),
          obscureText: obscureText,
          validator: (String? value, BuildContext context) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingresa la Contraseña';
            }
            if (value.length < 3) {
              return 'Debe tener al menos 3 caracteres';
            }
            if (widget.additionalValidator != null) {
              return widget.additionalValidator!(value);
            }
          },
          onChanged: (String? value, bool valid) {
            widget.onChange(value, valid);
          },
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ],
    );
  }
}
