import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/custom_progress_indicator.dart';
import 'package:login_flutter/src/utils/widgets/pez_details_modal_view.dart';

import '../../models/peces_model.dart';

class CardCarouselImages extends StatefulWidget {
  final Pez pez;

  const CardCarouselImages({super.key, required this.pez});

  @override
  CardCarouselImagesState createState() => CardCarouselImagesState();
}

class CardCarouselImagesState extends State<CardCarouselImages> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => showDialog(
              barrierDismissible: false,
              barrierColor: Colors.black87,
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: PezDetailsModalView(
                    pez: widget.pez,
                  ),
                );
              },
            ),
        child: widget.pez.imageRoute.isNotEmpty
            ? _buildImage()
            : const CustomProgressIndicator());
  }

  Widget _buildImage() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Image.asset(
            widget.pez.imageRoute,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: _buildLikeButton(),
        ),
      ],
    );
  }

  Widget _buildLikeButton() {
    return CircleAvatar(
      radius: 27,
      backgroundColor: Colors.teal,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        child: IconButton(
          onPressed: () => setState(() {
            widget.pez.toggleLike();
          }),
          icon: Icon(
            widget.pez.isLiked ? Icons.favorite : Icons.favorite_border,
            color: widget.pez.isLiked ? Colors.red : Colors.grey,
            size: widget.pez.isLiked ? 30 : 25,
          ),
        ),
      ),
    );
  }
}
