// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:movie_app/explore_module/explore_screen_initial.dart';
// import 'package:movie_app/home_module/home_screen.dart';
// import 'package:movie_app/my_list_module/my_list_screen.dart';
//
// import '../Download_module/Downloads.dart';
// import '../constants.dart';
// import '../profile_module/profilePage.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   CustomBottomNavBar({Key? key, required this.currIndex}) : super(key: key);
//   int currIndex;
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   /// NavBar Items
//   List<BottomNavigationBarItem> navbar = [
//     const BottomNavigationBarItem(
//       icon: Icon(IconlyLight.home),
//       label: 'Home',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(IconlyLight.discovery),
//       label: 'Explore',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(IconlyLight.bookmark),
//       label: 'My List',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(IconlyLight.download),
//       label: 'Download',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(IconlyLight.profile),
//       label: 'Profile',
//     ),
//   ];
//
//   /// NavBar Screens
//   final List<Widget> _screens = [
//     const Home(),
//     const Explore(),
//     const MyList(),
//     const Downloads(),
//     const profilePage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: widget.currIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: Container(
//         height: 75.0,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16.0), // adjust to your liking
//             topRight: Radius.circular(16.0), // adjust to your liking
//           ),
//           color: kNavBarBackgroundColor, // put the color here
//         ),
//         child: BottomNavigationBar(
//           elevation: kNavBarElevation,
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.transparent,
//           selectedItemColor: kNavBarSelectedItemColor,
//           selectedLabelStyle: kNavBarSelectedItemTextStyle,
//           unselectedItemColor: kUnSelectedItemColor,
//           unselectedLabelStyle: kNavBarUnSelectedItemTextStyle,
//           iconSize: kNavBarIconSize,
//           currentIndex: widget.currIndex,
//           items: navbar,
//           onTap: (changedIndex) {
//             setState(() {
//               widget.currIndex = changedIndex;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
