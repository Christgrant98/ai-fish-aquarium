import 'package:flutter/material.dart';

import 'text_view.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool isAppColor;
  final Icon? icon;
  final Border? border;
  final Color? color;
  final Color? buttonTextColor;
  final FontWeight? fontWeight;
  final Widget? widget;

  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    required this.onPressed,
    this.text,
    this.isAppColor = true,
    this.fontSize,
    this.icon,
    this.border,
    this.color,
    this.buttonTextColor,
    this.fontWeight,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: color ?? (isAppColor ? Colors.black : Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: border ?? (isAppColor ? null : Border.all(color: Colors.black)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: widget ??
            (icon == null
                ? TextView(
                    text: text,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    fontSize: fontSize ?? 15,
                    color: buttonTextColor ?? Colors.white,
                  )
                : Row(
                    children: [
                      TextView(
                        text: text,
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize ?? 15,
                        color: buttonTextColor ?? Colors.black,
                      ),
                      const SizedBox(width: 1),
                      Expanded(child: icon!),
                    ],
                  )),
      ),
    );
  }
}
