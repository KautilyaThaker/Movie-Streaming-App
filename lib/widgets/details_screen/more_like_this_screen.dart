import 'package:flutter/material.dart';

import '../../database.dart';
import '../poster_card.dart';

class MoreLikeThisScreen extends StatefulWidget {
  const MoreLikeThisScreen({Key? key}) : super(key: key);

  @override
  State<MoreLikeThisScreen> createState() => _MoreLikeThisScreenState();
}

class _MoreLikeThisScreenState extends State<MoreLikeThisScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: shows.length,
        padding: EdgeInsets.only(top: 16.0),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return PosterCard(
            image: shows.elementAt(index)['poster']!,
            rating: shows.elementAt(index)['rating']!,
            height: 200,
            width: 140,
            borderRadius: 16.0,
            title: shows.elementAt(index)['title']!,
          );
        });
  }
}
