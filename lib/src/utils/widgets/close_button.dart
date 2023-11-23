import 'package:flutter/material.dart';

class ButtonXmark extends StatelessWidget {
  const ButtonXmark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              color: Color.fromARGB(45, 0, 0, 0),
              blurRadius: 7,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 12,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
