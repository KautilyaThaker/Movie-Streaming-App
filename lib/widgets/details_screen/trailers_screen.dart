import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants.dart';
import '../../database.dart';

class TrailersScreen extends StatefulWidget {
  const TrailersScreen({Key? key}) : super(key: key);

  @override
  State<TrailersScreen> createState() => _TrailersScreenState();
}

class _TrailersScreenState extends State<TrailersScreen> {
  @override
  // TODO: Find a way to pass a list of similar movies or shows.
  /// Currently static
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      padding: EdgeInsets.only(top: 16.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // TODO: Setup an event to redirect to the target page
          },
          child: Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              /// Image and Info
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Poster
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image:
                              NetworkImage(movies.elementAt(index)['poster']!),
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Icon(
                      IconlyBold.play,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(width: 12.0),

                /// Title, Notification Content and Time
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        'Trailer ${index + 1}',
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6.0),

                      /// Trailer Time
                      Text(
                        '2m 45s',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kNotificationMessageTextStyle,
                      ),
                      const SizedBox(height: 6.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
