import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_app/constants.dart';

class premimunOfferCard{
  // String cost;
  premimunOfferCard();

  Widget buildOfferCard(String? cst){
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Icon(
              MaterialCommunityIcons.crown,
              color: kPrimaryColor,
              size: 60,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$$cst',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 32),),
                SizedBox(width: 4),
                Text('/month',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14),)
              ],
            ),
            SizedBox(height: 15),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(Icons.check,color: kPrimaryColor,),
              title: Text('Watch all you want. Ad-free.'),
            ),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
              leading: Icon(Icons.check,color: kPrimaryColor,),
              title: Text('Allow streaming of 4K.'),
            ),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(Icons.check,color: kPrimaryColor,),
              title: Text('Video and Audio quality is better.'),
            ),

          ],
        ),
      ),
    );
  }
}