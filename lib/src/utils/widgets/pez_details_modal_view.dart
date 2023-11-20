import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/comment.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/models/user_model.dart';
import 'package:login_flutter/src/providers/user_provider.dart';
import 'package:login_flutter/src/utils/widgets/base_modal.dart';
import 'package:login_flutter/src/utils/widgets/card_carousel_image.dart';
import 'package:login_flutter/src/utils/widgets/comment_form_field.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';
import 'package:provider/provider.dart';

enum StepView {
  initial,
  interactionView,
}

class PezDetailsModalView extends StatefulWidget {
  final Pez pez;

  const PezDetailsModalView({super.key, required this.pez});

  @override
  State<PezDetailsModalView> createState() => _PezDetailsModalViewState();
}

class _PezDetailsModalViewState extends State<PezDetailsModalView> {
  StepView step = StepView.initial;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.all(20),
      insetPadding: EdgeInsets.all(20),
      content: Container(
        height:
            step == StepView.initial ? screenHeight * 0.6 : screenHeight * 0.5,
        width: screenWidth * 0.9,
        child: _buildFishModalContent(),
      ),
    );
  }

  Widget _buildFishModalContent() {
    if (StepView.initial == step) {
      return Stack(
        children: [
          Column(
            children: [
              Expanded(child: _buildHeaderInformation()),
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
          InkWell(
            onTap: () {
              setState(() => step = StepView.initial);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 18.5,
                ),
                TextView(
                  fontWeight: FontWeight.bold,
                  text: 'Go back',
                  fontSize: 16,
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          _buildCommentBoxSection(),
        ],
      ));
    }
  }

  Widget _buildCommentBoxSection() {
    final currentUser = Provider.of<UserProvider>(context, listen: false).user!;

    return Column(
      children: [
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: widget.pez.comments?.length ?? 0,
            itemBuilder: (context, index) {
              Comment comment = widget.pez.comments![index];
              return _buildCommentCard(comment);
            },
          ),
        ),
        const SizedBox(height: 15),
        CommentFormField(
          controller: commentController,
          actionSend: () => _addCommentToPez(user: currentUser),
        ),
      ],
    );
  }

  Card _buildCommentCard(Comment comment) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      color: CupertinoColors.systemGrey6,
      elevation: 1,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: '@${comment.username}',
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
            TextView(
              text: comment.mail,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        subtitle: TextView(
          text: comment.comment,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildHeaderInformation() {
    return Column(
      children: [
        TextView(
          text: widget.pez.name,
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading3.gif"),
            image: AssetImage(widget.pez.imageRoute),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 155,
          child: Center(
            child: SingleChildScrollView(
              child: TextView(
                text: widget.pez.description,
                textAlign: TextAlign.justify,
                color: Colors.black,
                fontSize: 13.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
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