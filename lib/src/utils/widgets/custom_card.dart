import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

class CustomCard extends StatelessWidget {
  final Color? cardColor;
  final String title;
  final double? height;
  final String subtitle;
  final void Function()? onTap;
  final FontWeight? titleWeight;
  final bool? hasLeading;
  final double? titleSize;
  final IconData? icon;
  final Color iconBackgoundColor;
  final Color iconColor;
  final Widget? trailing;
  const CustomCard({
    Key? key,
    required this.title,
    this.subtitle = '',
    this.onTap,
    required this.icon,
    required this.iconBackgoundColor,
    required this.iconColor,
    this.titleWeight,
    this.titleSize,
    this.cardColor,
    this.trailing,
    this.height,
    this.hasLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: SizedBox(
        height: height ?? 100,
        child: Center(
          child: ListTile(
            onTap: onTap,
            leading: hasLeading == true
                ? CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 28,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: iconBackgoundColor,
                      child: Icon(
                        icon,
                        size: 35,
                        color: iconColor,
                      ),
                    ),
                  )
                : null,
            title: TextView(
              text: title,
              fontWeight: titleWeight ?? FontWeight.w900,
              fontSize: titleSize ?? 18,
            ),
            subtitle: subtitle.isNotEmpty
                ? TextView(
                    text: subtitle,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )
                : null,
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
