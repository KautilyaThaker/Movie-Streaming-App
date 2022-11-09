import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

import 'components/comment_bar.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// For padding
        const SizedBox(height: 8.0),

        /// Number of Comments and see all button
        SizedBox(
          height: 32.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO: Find number of comments and show here.
              Text(
                '24.6K Comments',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              TextButton(
                  onPressed: () {
                    // TODO: Trigger on see all event
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: kAppThemeRed,
                    ),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 8.0),

        /// ListView to display all the comments
        Flexible(
          child: ListView.builder(
            itemCount: 12,
            padding: EdgeInsets.only(top: 16.0),
            itemBuilder: (context, index) {
              return const CommentBar();
            },
          ),
        ),
      ],
    );
  }
}
