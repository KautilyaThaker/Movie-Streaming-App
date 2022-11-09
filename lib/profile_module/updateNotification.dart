import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class updateNotification extends StatefulWidget {
  const updateNotification({Key? key}) : super(key: key);

  @override
  State<updateNotification> createState() => _updateNotificationState();
}

class _updateNotificationState extends State<updateNotification> {

  bool _toggle = true;
  List<String> _list = [
    'General Notification',
    'New Arrival',
    'New Service Available',
    'New Release Movie',
    'App Updates',
    'Subscription'
  ];
  Map<String,bool> _toggleList = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Notification',
          style: TextStyle( fontSize: 24),
        ),
      ),
      body: Container(
        child: ListView(
          children: _buildSwitch(),
        ),
      ),
    );
  }

  List<Widget> _buildSwitch(){
    return _list.map((e) => SwitchListTile(
      activeTrackColor: kPrimaryColor,
      activeColor: Colors.white,
      
      value: _toggleList[e]??false,
      onChanged: (value) {
        setState(() {
          if(_toggleList[e]==null){
            _toggleList[e]=false;
          }
          _toggleList[e] = !(_toggleList[e]??false);
        });
      },
      title: Text(
        e,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    )).toList();
  }
}
