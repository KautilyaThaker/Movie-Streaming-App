import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/profile_module/Premimum/payment.dart';
import 'package:movie_app/profile_module/models/premimunOfferCard.dart';
import 'package:movie_app/provider/premimum_provider.dart';
import 'package:provider/provider.dart';
import '';

class subscribePremium extends StatefulWidget {
  const subscribePremium({Key? key}) : super(key: key);

  @override
  State<subscribePremium> createState() => _subscribePremiumState();
}

class _subscribePremiumState extends State<subscribePremium> {

  List<String> premimumPack = ['9.99','99.99'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Subscribe to Premium',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Text(
                      maxLines: 2,
                      'Enjoy Watching Full-HD Movies, without restrictions and without ads',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: _buildOffers(),
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildOffers(){
    final offer = premimunOfferCard();
    return premimumPack.map((e) => GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>payment()));
        context.read<PremimumProvider>().getPack(e);
      },
      child: offer.buildOfferCard(e),
    )).toList();
  }
}


