import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/profile_module/downloads.dart';
import 'package:movie_app/profile_module/Help%20Center/helpCenter.dart';
import 'package:movie_app/profile_module/language.dart';
import 'package:movie_app/profile_module/privacyPolicy.dart';
import 'package:movie_app/profile_module/models/profilePageList.dart';
import 'package:movie_app/profile_module/security.dart';
import 'package:movie_app/profile_module/Premimum/subscribePremium.dart';
import 'package:movie_app/profile_module/updateNotification.dart';
import 'package:movie_app/profile_module/updateProfile.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String selectedLanguage = 'English (US)';
  List<profilePageList> _settingList = [
    profilePageList(title: 'Edit Profile', iconData: IconlyLight.profile),
    profilePageList(title: 'Notification', iconData: IconlyLight.notification),
    profilePageList(title: 'Download', iconData: IconlyLight.download),
    profilePageList(title: 'Security', iconData: IconlyLight.shield_done),
    profilePageList(title: 'Language', iconData: FontAwesome.language),
    profilePageList(title: 'Help Center', iconData: IconlyLight.info_square),
    profilePageList(title: 'Privacy Policy', iconData: IconlyLight.danger),
  ];
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    final themeProvider = context.read<ThemeProvider>().isDark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'M',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 8),
              Text(
                'Profile',
                style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Container(
              child: Column(children: [
                Center(
                  child: CircleAvatar(
                    radius: 58,
                    backgroundColor: kPrimaryColorLight,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 18, 33),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Andrew Ainsley',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'andrewainsley@gmail.com',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ]),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(30.0)),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => subscribePremium()));
                },
                leading: Icon(
                  MaterialCommunityIcons.crown,
                  color: kPrimaryColor,
                  size: 60,
                ),
                title: Container(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Join Premium!',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                subtitle: Text(
                  maxLines: 2,
                  'Enjoy Watching Full-HD Movies, without restrictions and without ads',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                trailing: Icon(
                  IconlyLight.arrow_right_2,
                  color: kPrimaryColor,
                  size: 32,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: _buildList(),
            ),
            SwitchListTile(
              activeColor: kPrimaryColor,
              value: context.watch<ThemeProvider>().isDark,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme(value);
                print(context.read<ThemeProvider>().isDark);
              },
              title: Row(
                children: [
                  Icon(
                    IconlyLight.show,
                    size: 26,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(
                    width: 18.0,
                  ),
                  Text(
                    'Dark Mode',
                    style: kProfilePageListTextStyle,
                  ),
                ],
              ),
            ),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(
                IconlyLight.logout,
                color: kPrimaryColor,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kPrimaryColor),
              ),
              onTap: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottomSheet(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 250,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 180,vertical: 12),
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(20),

                ),
              ),
              Text(
                'Logout',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: kPrimaryColor),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                height: 50,
              ),
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 5,
          left: 5,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width*0.43,60),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color.fromARGB(100, 252, 210, 213),
                      foregroundColor: kPrimaryColor,
                    ),
                    onPressed: (){},
                    child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width*0.43,60),
                      elevation: 6,
                      shadowColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: ()=> exit(0),
                    child: Text('Yes,  Logout',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  List<Widget> _buildList() {
    return _settingList
        .map(
          (e) => Container(
            child: ListTile(
              onTap: () async {
                if (e.title == 'Edit Profile') {
                  print('Edit Profile');
                  final returnLanguage = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => updateProfile()));
                  setState(() {
                    selectedLanguage = returnLanguage;
                  });
                }
                if (e.title == 'Notification') {
                  print('notification');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => updateNotification()));
                }
                if (e.title == 'Download') {
                  print('Download');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => downloads()));
                }
                if (e.title == 'Security') {
                  print('Security');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => security()));
                }
                if (e.title == 'Language') {
                  print('Language');
                  final returnLanguage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => language(
                                selectedLanguage: selectedLanguage,
                              )));
                  setState(() {
                    selectedLanguage = returnLanguage;
                  });
                }
                if (e.title == 'Help Center') {
                  print('Help Center');
                  print(_settingList.indexOf(e));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => helpCenter()));
                }
                if (e.title == 'Privacy Policy') {
                  print('Privacy Policy ');
                  print(_settingList.indexOf(e));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => privacyPolicy()));
                }
              },
              horizontalTitleGap: 4,
              leading: Icon(e.iconData,
                  color: Theme.of(context).iconTheme.color, size: 26),
              title: Text(
                e.title,
                style: kProfilePageListTextStyle,
              ),
              trailing: Container(
                // color: Colors.red.shade100,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _settingList.indexOf(e) == 4 ? selectedLanguage : '',
                      style: kProfilePageListTextStyle,
                    ),
                    SizedBox(width: 4),
                    Icon(
                      color: Theme.of(context).iconTheme.color,
                      IconlyLight.arrow_right_2,
                      size: 24,
                    ),
                    // GestureDetector(
                    //
                    // )
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
