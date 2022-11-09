import 'package:flutter/material.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class privacyPolicy extends StatefulWidget {
  const privacyPolicy({Key? key}) : super(key: key);

  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {
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
          'Privacy Policy',
          style: TextStyle( fontSize: 24),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('1. Types of Data We Collect',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
                ' ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'
                ' laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in'
                ' voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat'
                ' non proident, sunt in culpa qui officia deserunt mollit anim id est'
                ' laborum.',
                style: TextStyle(color: context.read<ThemeProvider>().isDark?Colors.white54:Colors.black54, fontSize: 14),textAlign: TextAlign.justify),
            SizedBox(height: 16),
            Text('2. Use of Your Personal Data',style: TextStyle( fontSize: 20)),
            SizedBox(height: 16),
            Text('Magna etiam tempor orci eu lobortis elementum nibh. Vulputate enim nulla aliquet porttitor'
                ' lacus. Orci sagittis eu volutpat odio. Cras semper auctor neque vitae tempus quam pellentesque'
                ' nec. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Commodo elit at'
                ' imperdiet dui. Nisi vitae suscipit tellus mauris a diam. Erat pellentesque adipiscing commodo'
                ' elit at imperdiet dui. Mi ipsum faucibus vitae aliquet nec ullamcorper. Pellentesque pulvinar'
                ' pellentesque habitant morbi tristique senectus et.',
                style: TextStyle(color:context.read<ThemeProvider>().isDark?Colors.white54:Colors.black54, fontSize: 14),textAlign: TextAlign.justify),
            SizedBox(height: 16),
            Text('3. Disclosure of Your Personal Data',style: TextStyle( fontSize: 20)),
            SizedBox(height: 16),
            Text('Consequat id porta nibh venenatis cras sed. Ipsum nunc aliquet bibendum enim facilisis gravida'
                ' neque. Nibh tellus molestie nunc non blandit massa. Quam pellentesque nec nam aliquam sem et'
                ' tortor consequat id. Faucibus vitae aliquet nec ullamcorper sit amet risus. Nunc consequat'
                ' interdum varius sit amet. Eget magna fermentum iaculis eu non diam phasellus vestibulum. Pulvinar'
                ' pellentesque habitant morbi tristique senectus et. Lorem donec massa sapien faucibus et molestie.'
                ' Massa tempor nec feugiat nisl pretium fusce id. Lacinia at quis risus sed vulputate odio. Integer'
                ' vitae justo eget magna fermentum iaculis. Eget gravida cum sociis natoque'
                ' penatibus et magnis.',
              style: TextStyle(color: context.read<ThemeProvider>().isDark?Colors.white54:Colors.black54, fontSize: 14,),textAlign: TextAlign.justify,),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
