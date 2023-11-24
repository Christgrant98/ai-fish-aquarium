import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

import '../models/peces_model.dart';
import '../providers/carousel_provider.dart';
import '../subViews/trivia_view.dart';
import '../subViews/trivia_view.dart';

class TriviaGamePage extends StatelessWidget {
  const TriviaGamePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: Column(
        children: [
          SizedBox(height: 35),
          TextView(
            text: 'Trivia',
            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          SizedBox(height: 35),
          TriviaView(),
        ],
      ),
    );
  }
}
