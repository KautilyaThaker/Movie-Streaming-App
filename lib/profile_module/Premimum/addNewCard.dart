import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_app/constants.dart';

class addNewCard extends StatefulWidget {
  const addNewCard({Key? key}) : super(key: key);

  @override
  State<addNewCard> createState() => _addNewCardState();
}

class _addNewCardState extends State<addNewCard> {
  String cardType = '';
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  // bool useGlassMorphism = false;
  // bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
        ),
        title: Text(
          'Add New Card',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(MaterialCommunityIcons.credit_card_scan))
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        // decoration: BoxDecoration(
        //   image: !useBackgroundImage
        //       ? const DecorationImage(
        //     image: ExactAssetImage('assets/bg.png'),
        //     fit: BoxFit.fill,
        //   )
        //       : null,
        // ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              CreditCardWidget(
                // glassmorphismConfig: useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                // bankName: 'Axis Bank',
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Theme.of(context).scaffoldBackgroundColor,
                // cardType: CardType.,
                // textStyle: TextStyle(fontFamily: 'Urbanist',color: Colors.primaries[],fontWeight: FontWeight.bold),
                // backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
                backgroundImage:'assets/card_bg.png' ,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange:
                    (CreditCardBrand creditCardBrand) {
                      cardType = creditCardBrand.brandName.toString().split('.').last;
                    },
                customCardTypeIcons: <CustomCardTypeIcon>[
                  // CustomCardTypeIcon(
                  //   cardType: CardType.mastercard,
                  //   cardImage: Image.asset(
                  //     'assets/mastercard.png',
                  //     height: 32,
                  //     width: 32,
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 22,top: 20),
                          child: Text('Card Details',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18))
                      ),
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.black,
                        cardNumberDecoration: _buildInputDecoration(
                            context, 'Card Number : XXXX XXXX XXXX XXXX'),
                        expiryDateDecoration:
                            _buildInputDecoration(context, 'XX / XX'),
                        cvvCodeDecoration:
                            _buildInputDecoration(context, 'XXX'),
                        cardHolderDecoration:
                            _buildInputDecoration(context, 'Your Name'),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12,),
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
                          child: Container(
                            child: const Text(
                              'Validate and Add',
                              style: TextStyle(
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            print('Card Type : '+cardType);
                            if (formKey.currentState!.validate()) {
                              print('Card Number : '+cardNumber.split(' ').last);
                              print('valid!');
                              Navigator.pop(context,[cardNumber.split(' ').last,cardType]);
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     const Text(
                      //       'Glassmorphism',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //       ),
                      //     ),
                      //     Switch(
                      //       value: useGlassMorphism,
                      //       inactiveTrackColor: Colors.grey,
                      //       activeColor: Colors.white,
                      //       activeTrackColor: Colors.green,
                      //       onChanged: (bool value) => setState(() {
                      //         useGlassMorphism = value;
                      //       }),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     const Text(
                      //       'Card Image',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //       ),
                      //     ),
                      //     Switch(
                      //       value: useBackgroundImage,
                      //       inactiveTrackColor: Colors.grey,
                      //       activeColor: Colors.white,
                      //       activeTrackColor: Colors.green,
                      //       onChanged: (bool value) => setState(() {
                      //         useBackgroundImage = value;
                      //       }),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context, String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      // labelText: 'Number',
      hintText: hintText,
      // labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
      hintStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: kPrimaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
