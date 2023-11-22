import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/custom_progress_indicator.dart';
import 'package:login_flutter/src/utils/widgets/pez_details_modal_view.dart';

import '../../models/peces_model.dart';

class CardImages extends StatefulWidget {
  final Pez pez;

  const CardImages({super.key, required this.pez});

  @override
  CardImagesState createState() => CardImagesState();
}

class CardImagesState extends State<CardImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                  onTap: () => showDialog(
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
                      ? Image.asset(widget.pez.imageRoute)
                      : const CustomProgressIndicator()),
            ),
          ),
          _buildLikeBttn(),
        ],
      ),
    );
  }

  Widget _buildLikeBttn() {
    return CircleAvatar(
      backgroundColor: Colors.black,
      child: IconButton(
        onPressed: () {
          setState(() {
            widget.pez.toggleLike();
          });
        },
        icon: Icon(
          widget.pez.isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.pez.isLiked ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
