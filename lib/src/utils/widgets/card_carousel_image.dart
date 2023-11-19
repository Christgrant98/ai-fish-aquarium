import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/comment.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

import '../../models/peces_model.dart';
import 'base_modal.dart';

enum StepView {
  initial,
  interactionView,
}

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
                return InfoModal(
                  pez: widget.pez,
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

class InfoModal extends StatefulWidget {
  final Pez pez;

  const InfoModal({super.key, required this.pez});

  @override
  State<InfoModal> createState() => _InfoModalState();
}

class _InfoModalState extends State<InfoModal> {
  StepView step = StepView.initial;

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      heightFactor: .65,
      widthFactor: .9,
      paddingValue: 10,
      content: _buildFishModalContent(),
    );
  }

  Widget _buildFishModalContent() {
    if (StepView.initial == step) {
      return Stack(
        children: [
          Column(
            children: [
              _buildHeaderInformation(),
              ElevatedButton(
                onPressed: () {
                  setState(() => step = StepView.interactionView);
                },
                child: const TextView(text: 'see coments'),
              )
            ],
          ),
        ],
      );
    } else if (StepView.interactionView == step) {
      return SingleChildScrollView(
        child: _buildInteractionSection(),
      );
    } else {
      return Container();
    }
  }

  Widget _buildHeaderInformation() {
    return Column(
      children: [
        Text(
          widget.pez.name,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading3.gif"),
            image: AssetImage(widget.pez.imageRoute),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          widget.pez.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 14,
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
        )
      ],
    );
  }

  Widget _buildInteractionSection() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() => step = StepView.initial);
          },
          child: const TextView(text: 'back'),
        ),
        Container(
          color: Colors.grey,
          height: 200,
          child: ListView.builder(
            itemCount: widget.pez.comments?.length ?? 0,
            itemBuilder: (context, index) {
              Comment comment = widget.pez.comments![index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(comment.username), Text(comment.mail)],
                ),
                subtitle: Text(comment.comment),
              );
            },
          ),
        ),
        TextFormField(
          maxLines: 5,
        )
      ],
    );
  }
}
