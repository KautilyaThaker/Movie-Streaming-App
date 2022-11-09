import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/profile_module/Help%20Center/FAQ.dart';
import 'package:movie_app/profile_module/Help%20Center/contactUs.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class helpCenter extends StatefulWidget {
  const helpCenter({Key? key}) : super(key: key);

  @override
  State<helpCenter> createState() => _helpCenterState();
}

class _helpCenterState extends State<helpCenter> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.grey[100],
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
            'Help Center',
            style: TextStyle( fontSize: 24),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(IconlyLight.moreCircle,color: Theme.of(context).iconTheme.color,))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1,color: context.read<ThemeProvider>().isDark?Colors.grey.shade500:Colors.grey.shade200),
                  )
                ),
                child: TabBar(
                  // indicator: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(color: Colors.red,width: 3)
                  //   )
                  // ),
                  indicatorColor: kPrimaryColor,
                  indicatorWeight: 3,
                  labelColor: kPrimaryColor,
                  overlayColor:MaterialStateProperty.all(kPrimaryColorLight),
                  unselectedLabelColor: Colors.grey.shade400,
                  tabs: [
                    Tab(text: 'FAQ'),
                    Tab(text: 'Contact US'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FAQ(),
            contactUS(),
          ],
        ),
      ),
    );
  }
}
