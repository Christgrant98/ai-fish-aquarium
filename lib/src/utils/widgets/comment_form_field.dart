import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/base_text_form_field.dart';

class CommentFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function() actionSend;
  const CommentFormField({
    super.key,
    required this.controller,
    required this.actionSend,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      minLines: 1,
      maxLines: 3,
      controller: controller,
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
    );
  }
}
