import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/comment.dart';
import 'package:login_flutter/src/utils/widgets/custom_progress_indicator.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';
import 'package:provider/provider.dart';

import '../../models/peces_model.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import 'base_modal.dart';
import 'custom_button.dart';

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
                        context: context,
                        builder: (context) {
                          return InfoModal(
                            pez: widget.pez,
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

class InfoModal extends StatefulWidget {
  final Pez pez;

  const InfoModal({super.key, required this.pez});

  @override
  State<InfoModal> createState() => _InfoModalState();
}

class _InfoModalState extends State<InfoModal> {
  StepView step = StepView.initial;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      heightFactor: step == StepView.initial ? .65 : .5,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(text: '${widget.pez.comments!.length} comments'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        setState(() => step = StepView.interactionView);
                      },
                      text: 'see comments',
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      return SingleChildScrollView(
          child: Column(
        children: [
          CustomButton(
            onPressed: () {
              setState(() => step = StepView.initial);
            },
            text: 'back',
          ),
          _buildInteractionSection(),
        ],
      ));
    }
  }

  Widget _buildInteractionSection() {
    final currentUser = Provider.of<UserProvider>(context, listen: false).user!;

    return Column(
      children: [
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
                  children: [
                    TextView(text: comment.username),
                    TextView(text: comment.mail)
                  ],
                ),
                subtitle: TextView(text: comment.comment),
              );
            },
          ),
        ),
        TextFormField(
          controller: commentController,
          minLines: 2,
          maxLines: 5,
          onChanged: (value) {},
        ),
        CustomButton(
          onPressed: () {
            _addCommentToPez(
              user: currentUser,
            );
          },
          text: 'Add Comment',
        ),
      ],
    );
  }

  Widget _buildHeaderInformation() {
    return Column(
      children: [
        TextView(
          text: widget.pez.name,
          color: Colors.grey,
          fontSize: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading3.gif"),
            image: AssetImage(widget.pez.imageRoute),
            fit: BoxFit.cover,
          ),
        ),
        TextView(
          text: widget.pez.description,
          textAlign: TextAlign.justify,
          color: Colors.black,
          fontSize: 14,
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
        )
      ],
    );
  }

  void _addCommentToPez({
    required User user,
  }) {
    String commentText = commentController.text;

    Comment newComment = _buildComment(
      username: user.username,
      mail: user.mail,
      commentText: commentText,
    );

    setState(() {
      widget.pez.comments!.add(newComment);
    });

    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (ctx) {
        return const AlertDialog(
          content: TextView(
            text: 'comment was sent successfully',
          ),
        );
      },
    );
  }

  _buildComment({
    required String username,
    required String mail,
    required String commentText,
  }) {
    return Comment(
      username: username,
      mail: mail,
      comment: commentText,
    );
  }
}
