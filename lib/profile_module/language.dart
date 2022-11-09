import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class language extends StatefulWidget {
  final String selectedLanguage;
  const language({Key? key,required this.selectedLanguage}) : super(key: key);

  @override
  State<language> createState() => _languageState();
}
List<String> _languages = [
  'Suggested',
  'English (US)',
  'English (UK)',
  'Language',
  'Mandarin',
  'Hindi',
  'Spanish',
  'French',
  'Arabic',
  'Bengali',
  'Russian',
  'Indonesia'
];
class _languageState extends State<language> {
  String? language;
  @override
  void initState() {
    super.initState();
    language = widget.selectedLanguage;
  }
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
          'Language',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [

            SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRadioButton(),
            ),
          ],
        ),
      ),
    );
  }


  List<Widget> _buildRadioButton(){
    return _languages.map((e) => (_languages.indexOf(e)!=(0)&&_languages.indexOf(e)!=(3))
        ?_buildRadio(e)
        :Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: _languages.indexOf(e)!=(3)?0:8),
        Container(
          height: _languages.indexOf(e)!=(3)?0:1,
          width: MediaQuery.of(context).size.width,
          color: context.read<ThemeProvider>().isDark?Colors.grey[500]:Colors.grey[200],
        ),
        SizedBox(height: _languages.indexOf(e)!=(3)?0:16),
        Text(e,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        SizedBox(height: 12)
      ],
    )).toList();
  }
  ListTile _buildRadio(String e){
    return ListTile(
      onTap: (){
        setState((){
          language = e.toString();
        });
        print(language);

        Timer(Duration(milliseconds: 150), () {
          Navigator.pop(context,language);
        });
        // Navigator.pop(context,language);
      },
      contentPadding: EdgeInsets.zero,
      title: Text(e,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18)),
      trailing: Radio(
        fillColor: MaterialStateProperty.all(kPrimaryColor),
        // focusColor: Colors.red,

        activeColor: kPrimaryColor,
        value: e,
        groupValue: language,
        onChanged: (value){
          print(widget.selectedLanguage);
          print(value);
          setState((){
            language = value.toString();
          });
          Timer(Duration(milliseconds: 150), () {
            Navigator.pop(context,language);
          });
          // Navigator.pop(context,language);
        },
      ),
    );
  }

}
