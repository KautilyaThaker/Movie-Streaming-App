import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class security extends StatefulWidget {
  const security({Key? key}) : super(key: key);

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {

  List<String> _controlList = [
    'Security Alerts',
    'Manage Devices',
    'Manage Permission',
  ];
  List<String> _securityList = [
    'Remember Me',
    'Face ID',
    'Biometric ID',
  ];
  Map<String,bool> _securityListToggle = {};
  List<String> _securityButton = ['Change Pin','Change Password'];
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
          'Security',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Control',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 8,),
            Column(children: _buildControl()),
            SizedBox(height: 8,),
            Text('Security',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 8,),
            Column(children: _buildSecurity()),
            SizedBox(height: 8,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Google Authenticator'),
              trailing: Icon(Icons.keyboard_arrow_right,color: kPrimaryColor,size: 28,),
            ),
            Column(children: _buildSecurityButton())
          ],
        ),
      ),
    );
  }

  List<Widget> _buildControl(){
    return _controlList.map((e) => ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(e),
      trailing: Icon(Icons.keyboard_arrow_right,color: Theme.of(context).iconTheme.color,size: 28,),
    )).toList();
  }

  List<Widget> _buildSecurity(){
    return _securityList.map((e) => SwitchListTile(
      contentPadding: EdgeInsets.zero,
      activeColor: kPrimaryColor,
      value: _securityListToggle[e]??false,
      onChanged: (value){
        if (_securityListToggle[e]==null){
          _securityListToggle[e]=false;
        }
        setState((){
          _securityListToggle[e]=!(_securityListToggle[e]??false);
        });
      },
      title: Text(e),
    )).toList();
  }

  List<Widget> _buildSecurityButton(){
    return _securityButton.map((e) => Container(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width,60),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Color.fromARGB(100, 252, 210, 213),
            foregroundColor: kPrimaryColor,
        ),
        onPressed: (){},
        child: Text(e,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    )).toList();
  }
}
