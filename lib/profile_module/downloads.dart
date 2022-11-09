import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/constants.dart';

class downloads extends StatefulWidget {
  const downloads({Key? key}) : super(key: key);

  @override
  State<downloads> createState() => _downloadsState();
}

class _downloadsState extends State<downloads> {

  bool _toggleWiFi = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        title: Text(
          'Download',
          style: TextStyle( fontSize: 24),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            SwitchListTile(
              activeColor: kPrimaryColor,
              value: _toggleWiFi,
              onChanged: (value){
                setState((){
                  _toggleWiFi=value;
                });
              },
              title: Row(
                children: [
                  Icon(Icons.wifi_outlined,color: Theme.of(context).iconTheme.color,size: 26,),
                  SizedBox(width: 20.0,),
                  Text('Wi-Fi Only',style: TextStyle(fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(IconlyLight.download,color: Theme.of(context).iconTheme.color, size: 26),
              title: Text(
                'Smart Downloads',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                IconlyLight.arrowRight2,
                color: Theme.of(context).iconTheme.color,
                size: 26,
              ),
            ),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(IconlyLight.video,color: Theme.of(context).iconTheme.color, size: 26),
              title: Text(
                'Video Quality',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                IconlyLight.arrowRight2,
                color: Theme.of(context).iconTheme.color,
                size: 26,
              ),
            ),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(MaterialCommunityIcons.microphone_outline,color: Theme.of(context).iconTheme.color, size: 26),
              title: Text(
                'Audio Quality',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                IconlyLight.arrowRight2,
                color: Theme.of(context).iconTheme.color,
                size: 26,
              ),
            ),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(IconlyLight.delete,color: Theme.of(context).iconTheme.color, size: 26),
              title: Text(
                'Delete All Downloads',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(IconlyLight.delete,color: Theme.of(context).iconTheme.color ,size: 26),
              title: Text(
                'Delete Cache',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
