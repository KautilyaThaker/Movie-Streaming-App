// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:http/http.dart' as http;
// import 'package:movie_app/constants.dart';
// import 'package:movie_app/widgets/custom_buttons.dart';
// import 'package:movie_app/widgets/details_screen/components/bordered_container.dart';
// import 'package:movie_app/widgets/details_screen/components/rating_bar.dart';
// import 'package:movie_app/widgets/details_screen/components/rating_bottomsheet.dart';
// import 'package:movie_app/widgets/details_screen/trailers_screen.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
//
// import '../../database.dart';
// import 'comments_screen.dart';
// import 'components/cast_box.dart';
// import 'more_like_this_screen.dart';
//
// class DetailsScreen extends StatefulWidget {
//   const DetailsScreen({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }
//
// class _DetailsScreenState extends State<DetailsScreen> {
//   late String poster;
//   late String title;
//   late String genre;
//   late String synopsis;
//   late String ageRating;
//   late String release;
//   late String rating;
//   late String region;
//   late String type;
//   List<DropdownMenuItem<String>> dropDownList = [
//     const DropdownMenuItem(
//       child: Text('Season 1'),
//       value: '1',
//     ),
//   ];
//   late String _dropDownValue;
//
//   @override
//   void initState() {
//     getInfo();
//     super.initState();
//   }
//
//   // Method to retrieve information of details to show here
//   void getInfo() {
//     for (var element in movies) {
//       if (element['title'] == widget.title) {
//         poster = element['poster']!;
//         title = element['title']!;
//         genre = element['genre']!;
//         synopsis =
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
//         ageRating = '13+';
//         release = element['release']!;
//         rating = element['rating']!;
//         region = 'United States';
//         type = element['type']!;
//         _dropDownValue = '1';
//         break;
//       }
//     }
//     for (var element in shows) {
//       if (element['title'] == widget.title) {
//         poster = element['poster']!;
//         title = element['title']!;
//         genre = element['genre']!;
//         synopsis =
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
//         ageRating = '13+';
//         release = element['release']!;
//         rating = element['rating']!;
//         region = 'United States';
//         type = element['type']!;
//         int numberOfSeason = int.parse(element['numberOfSeasons']!);
//         for (int i = 2; i <= numberOfSeason; i++) {
//           dropDownList.add(DropdownMenuItem(
//             child: Text('Season $i'),
//             value: '$i',
//           ));
//         }
//         _dropDownValue = '1';
//         break;
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     void dropDownCallback(String? selectedValue) {
//       if (selectedValue is String) {
//         setState(() {
//           _dropDownValue = selectedValue;
//         });
//       }
//     }
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Poster
//             Container(
//               height: 320.0,
//               width: width,
//               decoration: BoxDecoration(
//                 /// Recent Hit Poster Goes Here
//                 image: DecorationImage(
//                   image: NetworkImage(poster),
//                   alignment: Alignment.topCenter,
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                       Colors.black.withOpacity(0.15), BlendMode.darken),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(16.0, 56.0, 16.0, 24.0),
//                 child: Stack(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         /// Search Button and Notification Button
//                         IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: const Icon(
//                             IconlyLight.arrowLeft,
//                             color: Colors.white,
//                             size: 28.0,
//                           ),
//                         ),
//
//                         /// Notification Button
//                         IconButton(
//                           onPressed: () {
//                             // TODO: Perform Cast Screen action
//                           },
//                           icon: const Icon(Icons.cast),
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             /// Title,bookmark and share button
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 0.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   /// Title
//                   SizedBox(
//                     width: width * 0.675,
//                     child: Text(
//                       title,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: kDetailsScreenTitleTextStyle,
//                     ),
//                   ),
//
//                   Row(
//                     children: [
//                       /// Bookmark
//                       IconButton(
//                         onPressed: () {
//                           // TODO: Perform boomark action
//                         },
//                         icon: const Icon(
//                           IconlyLight.bookmark,
//                           size: 20.0,
//                         ),
//                       ),
//
//                       /// Share
//                       IconButton(
//                         onPressed: () async {
//                           //TODO: generate a shareable url for the application
//                           const webURL = 'google.com';
//                           final uri = Uri.parse(poster);
//                           final res = await http.get(uri);
//                           final bytes = res.bodyBytes;
//                           final temp = await getTemporaryDirectory();
//                           final path = '${temp.path}/image.jpg';
//                           File(path).writeAsBytesSync(bytes);
//
//                           await Share.shareFiles([path],
//                               text: 'Check out $title\nURL: $webURL');
//                         },
//                         icon: const Icon(
//                           IconlyLight.send,
//                           size: 20.0,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//
//             /// rating, release year, age rating, region, subtitle available or not.
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     /// Rating
//                     RatingIndicator(
//                       rating: rating,
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           isScrollControlled: true,
//                           backgroundColor: Colors.transparent,
//                           builder: (context) => RatingBottomSheet(title: title),
//                         );
//                       },
//                     ),
//                     const SizedBox(width: 12.0),
//
//                     /// Release year
//                     Text(
//                       release,
//                       style: const TextStyle(
//                         fontSize: 14.5,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                         textBaseline: TextBaseline.ideographic,
//                       ),
//                     ),
//                     const SizedBox(width: 14.0),
//
//                     /// Age Rating
//                     BorderedContainer(content: ageRating),
//
//                     /// Region
//                     BorderedContainer(content: region),
//
//                     /// Subtitle available or not
//                     const BorderedContainer(content: 'Subtitle'),
//                   ],
//                 ),
//               ),
//             ),
//
//             /// Play and Download Buttons
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: CustomButtons(
//                       onPress: () {
//                         // TODO: Play the movie
//                       },
//                       backgroundColor: kAppThemeRed,
//                       borderColor: kAppThemeRed,
//                       borderWidth: 2.0,
//                       icon: IconlyBold.play,
//                       label: 'Play',
//                     ),
//                   ),
//                   const SizedBox(width: 8.0),
//                   Expanded(
//                     child: CustomButtons(
//                       onPress: () {
//                         // TODO: Download the movie
//                       },
//                       backgroundColor: Colors.white,
//                       borderColor: kAppThemeRed,
//                       borderWidth: 2.0,
//                       icon: IconlyBold.download,
//                       label: 'Download',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             /// Genre
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
//               child: Text(
//                 "Genre: $genre",
//                 style: const TextStyle(
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black),
//               ),
//             ),
//
//             /// Synopsis
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 8.0),
//               child: Text(
//                 synopsis,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//
//             /// Cast
//             // TODO: Fetch actual cast data from database and insert here.
//             Container(
//               height: 63.0,
//               margin: const EdgeInsets.only(left: 12.0, right: 12.0),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 23,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return const CastBox();
//                 },
//               ),
//             ),
//
//             /// Episodes
//             Visibility(
//               visible: type == 'movie' ? false : true,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
//                 child: Column(
//                   children: [
//                     /// Episodes and season drop down
//                     SizedBox(
//                       height: 32.0,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // TODO: Find number of comments and show here.
//                           const Text(
//                             'Episodes',
//                             style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black,
//                             ),
//                           ),
//                           DropdownButton(
//                             items: dropDownList,
//                             value: _dropDownValue,
//                             dropdownColor: Colors.white,
//                             style: const TextStyle(
//                               color: kAppThemeRed,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             elevation: 0,
//                             onChanged: dropDownCallback,
//                             icon: const Padding(
//                               padding: EdgeInsets.only(left: 6.0),
//                               child: Icon(
//                                 IconlyLight.arrowDown2,
//                                 color: kAppThemeRed,
//                               ),
//                             ),
//                             iconSize: 18.0,
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 8.0),
//
//                     /// Episode ListView
//                     // TODO: First fetch number of episodes in each season and then present list only for that many episodes. Also, enable dynamic widget so that based on selected season episodes will be displayed.
//                     SizedBox(
//                       height: 110.0,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 10,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               // TODO: Play the episode
//                             },
//                             child: Container(
//                               height: 110.0,
//                               width: 150.0,
//                               margin: const EdgeInsets.only(right: 12.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16.0),
//                                 image: DecorationImage(
//                                     alignment: Alignment.topCenter,
//                                     // TODO: Fetch each episode thumbnail and pass here the link
//                                     image: NetworkImage(poster),
//                                     fit: BoxFit.cover),
//                               ),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   const Icon(
//                                     IconlyBold.play,
//                                     color: Colors.white,
//                                     size: 28.0,
//                                   ),
//                                   Positioned(
//                                     bottom: 6.0,
//                                     left: 8.0,
//                                     child: Text(
//                                       'Episode ${index + 1}',
//                                       style: const TextStyle(
//                                         fontSize: 13.0,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             /// TabView
//             Container(
//               margin: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   DefaultTabController(
//                     length: 3, // length of tabs
//                     initialIndex: 0,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         /// TabBar
//                         Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 2.0,
//                                 color: Colors.grey[200]!,
//                               ),
//                             ),
//                           ),
//                           child: TabBar(
//                             labelColor: kAppThemeRed,
//                             unselectedLabelColor: Colors.grey[350],
//                             indicatorColor: kAppThemeRed,
//                             indicatorWeight: 3.0,
//                             labelPadding: EdgeInsets.zero,
//                             labelStyle: const TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             unselectedLabelStyle: const TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             tabs: const [
//                               Tab(text: 'Trailers'),
//                               Tab(text: 'More Like This'),
//                               Tab(text: 'Comments'),
//                             ],
//                           ),
//                         ),
//
//                         /// TabBarView
//                         Container(
//                           height: height * 0.75,
//                           child: const TabBarView(
//                             children: <Widget>[
//                               TrailersScreen(),
//                               MoreLikeThisScreen(),
//                               CommentsScreen(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
