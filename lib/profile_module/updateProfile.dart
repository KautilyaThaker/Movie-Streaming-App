import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_app/constants.dart';

class updateProfile extends StatefulWidget {
  const updateProfile({Key? key}) : super(key: key);

  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {

  List<String> _gender = ['Select Gender','Male','Female','Other'];
  String? _genderValue = 'Select Gender';
  List<String> _country = [
    'Select Contry',
    'English (US)',
    'English (UK)',
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Bengali',
    'Russian',
    'Indonesia'
  ];
  String? _countryValue = 'Select Contry';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_rounded,),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle( fontSize: 24),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
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
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextFormField(
                // focusNode: focusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  hintText: 'Full Name',
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  hintText: 'Nick Name',
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 18),

                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  suffixIcon: Icon(Icons.mail_outline_outlined,color: Colors.black,),
                  hintText: 'E-Mail',
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: IntlPhoneField(
                dropdownIconPosition: IconPosition.trailing,
                dropdownIcon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 18),
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 7),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey[200],
                focusColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(15.0),
                value: _genderValue,
                icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                elevation: 16,
                isExpanded: true,
                underline: Container(height: 0),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _genderValue = value!;
                  });
                },
                items: _gender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text('$value',style: TextStyle(color: Colors.black),),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 7),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey[200],
                focusColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(15.0),
                value: _countryValue,
                icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                elevation: 16,
                isExpanded: true,
                underline: Container(height: 0),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _countryValue = value!;
                  });
                },
                items: _country.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(color: Colors.black),),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width,60),
                  elevation: 6,
                  shadowColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: kPrimaryColor,
              ),
              onPressed: (){},
              child: Text('Update',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
