import 'dart:ui';

import 'package:flutter/material.dart';

class BaseModal extends StatelessWidget {
  final Widget? content;
  final void Function()? onClose;
  final double? widthFactor;
  final double? heightFactor;
  final double? borderRadius;
  final double? paddingValue;

  const BaseModal({
    Key? key,
    this.content,
    this.onClose,
    this.widthFactor = 0.9,
    this.heightFactor = 1,
    this.borderRadius = 12,
    this.paddingValue = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 800;

    return _buildContent(isLargeScreen);
  }

  Widget _buildContent(bool isLargeScreen) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: FractionallySizedBox(
        widthFactor: isLargeScreen ? widthFactor! * .3 : widthFactor,
        heightFactor: heightFactor,
        child: Container(
          padding: EdgeInsets.all(paddingValue!),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: content != null
              ? Material(
                  color: Colors.transparent,
                  child: content!,
                )
              : Container(),
        ),
      ),
    );
  }
}
