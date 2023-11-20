import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseTextFormField extends StatefulWidget {
  final Function(String?, bool)? onChange;
  final Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final int maxLines;
  final int? minLines;
  final String? fieldValue;
  final bool obscureText;
  final TextAlign? textAlign;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;

  final bool readOnly;
  final bool enabled;
  const BaseTextFormField({
    super.key,
    required this.controller,
    this.onChange,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.decoration,
    this.maxLines = 1,
    this.minLines,
    this.fieldValue,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.textAlign,
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormField();
}

class _BaseTextFormField extends State<BaseTextFormField> {
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.fieldValue ?? '';
    widget.controller.addListener(_onChange);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration defaultDecoration = _buildDefaultDecoration();

    return TextFormField(
      enabled: widget.enabled,
      textAlign: widget.textAlign ?? TextAlign.start,
      readOnly: widget.readOnly,
      style: GoogleFonts.quicksand(fontSize: 14),
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: widget.decoration == null
          ? defaultDecoration
          : widget.decoration!.copyWith(
              border: widget.decoration?.border ?? defaultDecoration.border,
              enabledBorder: widget.decoration?.enabledBorder ??
                  defaultDecoration.enabledBorder,
              focusedBorder: widget.decoration?.focusedBorder ??
                  defaultDecoration.focusedBorder,
              errorBorder: widget.decoration?.errorBorder ??
                  defaultDecoration.errorBorder,
              focusedErrorBorder: widget.decoration?.focusedErrorBorder ??
                  defaultDecoration.focusedErrorBorder,
              errorText: _getErrorText(widget.controller.text),
            ),
      validator: _getErrorText,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  void _onChange() {
    setState(() {
      _touched = true;
      String value = widget.controller.text;
      widget.onChange!(value, _isValid());
    });
  }

  bool _isValid() => null == _getErrorText(widget.controller.text);

  String? _getErrorText(String? value) {
    if (!_touched) return null;
    if (widget.validator == null) {
      return null;
    } else {
      return widget.validator!(value);
    }
  }

  InputDecoration _buildDefaultDecoration() {
    OutlineInputBorder defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 0.8,
        color: Color.fromARGB(255, 218, 218, 218),
      ),
    );

    return InputDecoration(
      labelStyle: GoogleFonts.quicksand(
        color: const Color.fromARGB(255, 190, 190, 190),
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.all(10),
      border: defaultBorder,
      enabledBorder: defaultBorder,
      focusedBorder: defaultBorder,
      errorBorder: defaultBorder,
      focusedErrorBorder: defaultBorder,
      errorText: _getErrorText(widget.controller.text),
    );
  }
}
