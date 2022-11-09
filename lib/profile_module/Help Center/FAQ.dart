import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {


  int _currentIndex = 0;
  final List<String> _FAQuestion = [
    'What is Movie?',
    'How to remove wishlist?',
    'How do I subscribe to premium?',
    'How do I can download movies?',
    'How to unsubscribe from premium?',
  ];
  List<String> _FAQtype = [
    'General',
    'Account',
    'Service',
    'Video',
    'Other',
  ];

  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildRow(),
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: SearchField(
              itemHeight: 35,
              focusNode: focusNode,
              searchInputDecoration: InputDecoration(
                prefixIcon: Icon(IconlyLight.search,color: Colors.grey,),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(IconlyLight.filter,color: kPrimaryColor,),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)
                ),
                fillColor: focusNode.hasFocus?kPrimaryColorLight:Colors.grey[200],
                filled: true,
              ),
              suggestions:
                _FAQuestion.map((e) => SearchFieldListItem(e,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(e),
                    ),
                )).toList(),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Column(
              children: _buildCard(),
            ),
          )
        ],
      ),
    );
  }


  List<Widget> _buildCard(){
    return _FAQuestion.map((e) => Card(
      margin: EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      elevation: 2,
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          trailing: Icon(IconlyBold.arrowDown2,color: kPrimaryColor,size: 30,),
          title: Text(e,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 1,
              color: context.read<ThemeProvider>().isDark?Colors.grey[500]:Colors.grey[200],
            ),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
          ],
        ),
      ),
    )).toList();
  }

  void _updateIndex(int index){
    setState((){
      _currentIndex=index;
    });
  }
  List<Widget> _buildRow(){
    return _FAQtype.map((e) => GestureDetector(
      onTap: (){
        _updateIndex(_FAQtype.indexOf(e));
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
            color: _FAQtype.indexOf(e)==_currentIndex?kPrimaryColor:Colors.white,
            border: Border.all(color: kPrimaryColor,width: 2),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Text(e,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: _FAQtype.indexOf(e)==_currentIndex?Colors.white:kPrimaryColor),),
      ),
    )).toList();
  }
}
