import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/comment.dart';

import '../../models/peces_model.dart';
import 'base_modal.dart';

class CardImages extends StatefulWidget {
  final Pez pez;

  const CardImages({super.key, required this.pez});

  @override
  CardImagesState createState() => CardImagesState();
}

class CardImagesState extends State<CardImages> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return BaseModal(
                  heightFactor: .65,
                  widthFactor: .9,
                  content: SingleChildScrollView(
                    child: _buildFishModalContent(),
                  ),
                );
              },
            ),
            child: FadeInImage(
              placeholder: const AssetImage("assets/loading3.gif"),
              image: AssetImage(widget.pez.imageRoute),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _buildLikeBttn(),
      ],
    );
  }

  Widget _buildFishModalContent() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage("assets/loading3.gif"),
                  image: AssetImage(widget.pez.imageRoute),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pez.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.pez.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    child: Container(
                        color: Colors.grey,
                        height: 200,
                        child: ListView.builder(
                          itemCount: widget.pez.comments?.length ?? 0,
                          itemBuilder: (context, index) {
                            Comment comment = widget.pez.comments![index];
                            return ListTile(
                              title: Row(
                                children: [
                                  Text(comment.username),
                                ],
                              ),
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
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
