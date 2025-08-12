import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/componants.dart';

class AboutMobilepage extends StatefulWidget {
  const AboutMobilepage({super.key});

  @override
  State<AboutMobilepage> createState() => _AboutMobilepageState();
}

class _AboutMobilepageState extends State<AboutMobilepage> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Colors.tealAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),

        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(4),
      child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(size: 20.0, color: Colors.black),
        ),
        endDrawer: DrawerMobile(),
        body: ListView(
          children: [
            CircleAvatar(
              backgroundColor: Colors.tealAccent,
              radius: 117.0,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsetsGeometry.all(8.0)),
                  SansBold(text: 'About Me', size: 35.0),
                  SizedBox(height: 20.0),
                  Sans(
                    text:
                        "Hello! I'm Vedant jagtap I specialize in flutter development",
                    size: 15.0,
                  ),
                  Sans(
                    text:
                        "I strive to ensure outstanding performance with state of ",
                    size: 15.0,
                  ),
                  Sans(
                    text:
                        "the art security for Android,IOS,Web,Linux and Window",
                    size: 15.0,
                  ),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      tealContainer('flutter'),
                      tealContainer('Firebase'),
                      tealContainer('Android'),
                      tealContainer('Windows'),
                    ],
                  ),
                ],
              ),
            ),
            // web development , first section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCard(imagePath: 'assets/images/webL.png', width: 200.0),
                SizedBox(height: 30.0),
                SansBold(text: 'Web Development', size: 20.0),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 10.0),
            Sans(
              text:
                  " I'm here to build your presence online with state of the art web apps",
              size: 15.0,
            ),
            //App development , second section
            Column(
              children: [
                AnimatedCard(
                  imagePath: 'assets/images/app.png',
                  width: 200.0,
                  reverse: true,
                ),
                SizedBox(height: 30.0),
                Sans(text: 'App development', size: 20.0),
              ],
            ),
            SizedBox(height: 10.0),
            Sans(
              text:
                  "Do you need a high-performance,responsive &  beautiful app? Don't worry,I've got you covered",
              size: 15,
            ),
            //Backend end deveopment,forth section
            Column(
              children: [
                AnimatedCard(
                  imagePath: 'assets/images/firebase.png',
                  width: 200.0,
                ),
                SizedBox(height: 30.0),
                Sans(text: 'Back-end Development', size: 20.0),
              ],
            ),
            SizedBox(height: 10.0),
            Sans(
              text:
                  "Do you want your back-end to be highly scalable & secure ? Lets have a conversation on how  I can help you with that",
              size: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
