import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/Download_module/Download_card.dart';
import 'package:movie_app/constants.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          // child: Image.asset(
          //     'assets/splash.png',
          // ),
          child: Text(
            'M',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        ),
        title: Text(
          'Download',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
                IconlyLight.search,
              size: 25.0,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Download_Card(),
    );
  }
}
