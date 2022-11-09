import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/profile_module/models/premimunOfferCard.dart';
import 'package:movie_app/provider/premimum_provider.dart';
import 'package:provider/provider.dart';

class confirmPayment extends StatefulWidget {
  final String? paymentmode;
  final IconData? icon;
  const confirmPayment(
      {Key? key, required this.paymentmode, required this.icon})
      : super(key: key);

  @override
  State<confirmPayment> createState() => _confirmPaymentState();
}

class _confirmPaymentState extends State<confirmPayment> {
  final premimun = premimunOfferCard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
        ),
        title: Text(
          'Review Summary',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              premimun.buildOfferCard(context.watch<PremimumProvider>().amount),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [BoxShadow(
                    blurRadius: 4,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                  )],
                  // border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('Amount'),
                      trailing:
                          Text(context.watch<PremimumProvider>().amount ?? '-'),
                    ),
                    ListTile(
                      leading: Text('Tax'),
                      trailing: Text('\$1.99'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text('Total'),
                      trailing: Text('\$\$\$'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [BoxShadow(
                    blurRadius: 4,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                  )],
                  // boxShadow: kElevationToShadow[1],
                  // border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(
                    widget.icon ?? FontAwesomeIcons.ccMastercard,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(widget.paymentmode ?? 'Your Card'),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          left: 10,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 60),
              elevation: 6,
              shadowColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () {
              _buildDialog(context);
            },
            child: Text(
              'Confirm Payment',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
  _buildDialog(BuildContext context) {
      return showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (context){
            return Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 15),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(MaterialCommunityIcons.crown,color: Colors.white,size: 60,),
                      ),
                      Text(
                        'Congratulations!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        'You have successfully subscribed 1 month premium. Enjoy the benefits!',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width*0.65, 60),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          backgroundColor: kPrimaryColor,
                        ),
                          onPressed: (){Navigator.pop(context);},
                          child: Text('OK',style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      );
  }

}

