import 'package:flutter/material.dart';

import '../constants.dart';
import 'details_screen/details_screen.dart';

class PosterCard extends StatefulWidget {
  const PosterCard(
      {Key? key,
      required this.image,
      required this.rating,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.title})
      : super(key: key);
  final String image;
  final String rating;
  final double height;
  final double width;
  final double borderRadius;
  final String title;

  @override
  State<PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<PosterCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailsScreen(
      //         title: widget.title,
      //       ),
      //     ),
      //   );
      // },
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            /// Poster-image goes here
            image: NetworkImage(widget.image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            /// Rating
            Container(
              margin: const EdgeInsets.all(12.0),
              height: 24.0,
              width: 34.0,
              decoration: BoxDecoration(
                color: kAppThemeRed,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: Center(
                child: Text(
                  widget.rating,
                  style: kFeaturedViewMovieRatingTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
