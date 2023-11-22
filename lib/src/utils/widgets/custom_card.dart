import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  final String title;
  final String subtitle;
  final void Function() onTap;
  final IconData? icon;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 28,
              child: CircleAvatar(
                  radius: 25,
                  backgroundColor: backgroundColor,
                  child: Icon(
                    icon,
                    size: 35,
                    color: iconColor,
                  )),
            ),
            title: TextView(
              text: title,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
            subtitle: TextView(
              text: subtitle,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
