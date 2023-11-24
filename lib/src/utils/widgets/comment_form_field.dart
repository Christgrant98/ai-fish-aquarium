import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/base_text_form_field.dart';

import 'text_view.dart';

class CommentFormField extends StatelessWidget {
  final void Function(String?, bool) onChange;
  final void Function(String)? onFieldSubmitted;
  final String title;
  final void Function() actionSend;
  const CommentFormField({
    super.key,
    required this.actionSend,
    required this.onChange,
    this.onFieldSubmitted,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: title,
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 2.5),
        BaseTextFormField(
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelStyle: const TextStyle(
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "Write a comment...",
            hintStyle: GoogleFonts.quicksand(
              color: const Color.fromARGB(255, 190, 190, 190),
              fontSize: 14,
            ),
            suffixIcon: InkWell(
              onTap: actionSend,
              child: const Icon(
                Icons.send_rounded,
                color: Colors.black,
              ),
            ),
          ),
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          validator: (String? value, BuildContext context) {
            return value!.isEmpty ? "Campo vacio" : null;
          },
        ),
      ],
    );
  }
}
