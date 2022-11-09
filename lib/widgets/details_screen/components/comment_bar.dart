import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../database.dart';

class CommentBar extends StatefulWidget {
  const CommentBar({Key? key}) : super(key: key);

  @override
  State<CommentBar> createState() => _CommentBarState();
}

class _CommentBarState extends State<CommentBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// For circle avatar, name and options button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Circle Avatar and Name
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22.0,
                    //TODO: Fetch the profile image from the database and display here
                    backgroundImage: NetworkImage(cast.first['profile']!),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    cast.first['name']!,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              /// Options button
              IconButton(
                onPressed: () {
                  //TODO: open options
                },
                icon: Icon(
                  IconlyLight.moreCircle,
                  size: 20.0,
                ),
              )
            ],
          ),

          /// For comment
          // TODO: Fetch comment from databas and display here

          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4.0),

          /// like, time and reply button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Like button
              GestureDetector(
                onTap: () {
                  // TODO: Change the icon and increse the
                },
                child: const Icon(
                  IconlyBold.heart,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 4.0),

              /// Like Counter
              GestureDetector(
                onTap: () {
                  // TODO: Show who has liked the comment
                },
                child: Text(
                  '1507',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 24.0),

              ///Time
              // TODO: Show accurate passed time
              Text(
                '2 days ago',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 24.0),

              /// Reply Button
              GestureDetector(
                onTap: () {
                  // TODO: Perform reply action
                },
                child: Text(
                  'Reply',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
