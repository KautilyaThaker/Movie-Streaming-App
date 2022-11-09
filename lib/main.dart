import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/Download_module/Downloads.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/my_list_module/my_list_screen.dart';
import 'package:movie_app/profile_module/Help%20Center/contactUs.dart';
import 'package:movie_app/profile_module/profilePage.dart';
import 'package:movie_app/provider/premimum_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ThemeProvider()),
          ChangeNotifierProvider(create: (_)=>PremimumProvider()),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    print(themeProvider.themeMode.name+" Mode");
    return MaterialApp(
      title: 'Movie App',
      // themeMode: ThemeMode.system,
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List pages = [
    Text('Home'),
    Text('Explore'),
    // Text('My List'),
    MyList(),
    Downloads(),
    profilePage(),
  ];

  int _currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        unselectedIconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        selectedItemColor: kPrimaryColor,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedIconTheme: IconThemeData(color: kPrimaryColor),
        items: [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(IconlyLight.discovery),label: 'explore'),
          BottomNavigationBarItem(icon: Icon(IconlyLight.bookmark),label: 'My List'),
          BottomNavigationBarItem(icon: Icon(IconlyLight.download),label: 'Download'),
          BottomNavigationBarItem(icon: Icon(IconlyLight.profile),label: 'Profile'),
        ],
      ),
    );
  }
}
