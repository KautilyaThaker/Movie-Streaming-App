import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/profile_module/Premimum/confirmPayment.dart';
import 'package:movie_app/profile_module/models/paymentMethods.dart';

import 'addNewCard.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {

  String cardtype ='';
  Map<String,IconData?> lst = {
    'PayPal': FontAwesomeIcons.paypal,
    'Google Pay':FontAwesomeIcons.google,
    'Apple Pay':FontAwesomeIcons.apple,
  };
  List<String> _paymentMode =['PayPal','Google Pay','Apple Pay'];
  List<IconData?> _paymentIcon = [FontAwesomeIcons.paypal,FontAwesomeIcons.google,FontAwesomeIcons.apple,null,];
  List<paymentMethod> _paymentMethod = [
    paymentMethod(iconData: FontAwesomeIcons.paypal, title: 'PayPal'),
    paymentMethod(iconData: FontAwesomeIcons.google, title: 'Google Pay'),
    paymentMethod(iconData: FontAwesomeIcons.apple, title: 'Apple Pay'),
  ];
  String? payment;
  @override
  void initState() {
    // TODO: implement initState
    payment = _paymentMethod.first.title.toString();
    super.initState();
  }

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
            onPressed: (){Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
        ),
        title: Text(
          'Payment',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(MaterialCommunityIcons.credit_card_scan))
        ],
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.fromLTRB(16,16,16,80),
          child: ListView(
            children: [
              Text('Select the payment method you want to use.',
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  children: _buildPaymentMethod(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color.fromARGB(100, 252, 210, 213),
                    foregroundColor: kPrimaryColor,
                  ),
                  onPressed: () async{
                    final newCard = await Navigator.push(context, MaterialPageRoute(builder: (context)=>addNewCard()));
                    setState(() {
                      cardtype = newCard[1];
                      lst['**** **** **** '+newCard[0]]=getIcon();
                    });
                    print('new card : '+newCard[1]);
                  },
                  child: Text(
                    'Add New Card',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>confirmPayment(paymentmode: payment,icon: lst[payment],)));
            },
            child: Text(
              'Continue',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }

  List<Widget> _buildPaymentMethod() {
    List<Widget> list = [];
    lst.forEach((title, icon){
      list.add(Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            blurRadius: 2,
            color: Theme.of(context).primaryColorDark.withOpacity(0.2),
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
          )],
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        margin: EdgeInsets.symmetric(vertical: 14),
        child: Center(
          child: ListTile(
            onTap: () {
              setState(() {
                payment = title.toString();
              });
            },
            contentPadding: EdgeInsets.all(10),
            leading: Icon(icon,
                color: Theme.of(context).iconTheme.color),
            title: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 18)),
            trailing: Radio(
              fillColor: MaterialStateProperty.all(kPrimaryColor),
              activeColor: kPrimaryColor,
              value: title,
              groupValue: payment,
              onChanged: (value) {
                print(value);
                setState(() {
                  payment = value.toString();
                });
              },
            ),
          ),
        ),
      ));
    }
    );
    return list;
  }

  IconData getIcon() {
    if(cardtype=='mastercard'){
      return FontAwesomeIcons.ccMastercard;
    }
    else if(cardtype=='americanExpress'){
      return FontAwesomeIcons.ccAmex;
    }
    else if(cardtype=='discover'){
      return FontAwesomeIcons.ccDiscover;
    }
    else if(cardtype=='visa'){
      return FontAwesomeIcons.ccVisa;
    }
    else return Icons.credit_card;
  }
}
