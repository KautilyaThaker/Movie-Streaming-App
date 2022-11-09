import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/profile_module/models/profilePageList.dart';

class contactUS extends StatefulWidget {
  const contactUS({Key? key}) : super(key: key);

  @override
  State<contactUS> createState() => _contactUSState();
}

class _contactUSState extends State<contactUS> {

  List<profilePageList> _serviceList = [
    profilePageList(title: 'Customer Service', iconData: FontAwesomeIcons.headset),
    profilePageList(title: 'WhatsApp', iconData: FontAwesomeIcons.whatsapp),
    profilePageList(title: 'Website', iconData: FontAwesomeIcons.globe),
    profilePageList(title: 'Facebook', iconData: FontAwesomeIcons.facebook),
    profilePageList(title: 'Twitter', iconData: FontAwesomeIcons.twitter),
    profilePageList(title: 'Instagram', iconData: FontAwesomeIcons.instagram),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: _buildSeviceList(),
      ),
    );
  }

  List<Widget> _buildSeviceList(){
    return _serviceList.map((e) => Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        leading: FaIcon(e.iconData,color: kPrimaryColor,size: 20,),
        title: Text(e.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
      ),
    )).toList();
  }
}
