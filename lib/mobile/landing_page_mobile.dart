import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/componants.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(size: 20.0, color: Colors.black),
      ),
      endDrawer: DrawerMobile(),
      body: ListView(
        children: [
          //introduction page
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: SansBold(text: "Hello I'm", size: 20.0),
                ),
                SansBold(text: 'Vedant Jagtap', size: 40.0),
                SansBold(text: 'Flutter Developer', size: 20.0),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 5.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 40.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans(text: 'jvedant2109@gmail.com', size: 15.0),
                        Sans(text: '+91 7387116373', size: 15.0),
                        Sans(text: '13/3 Szczecin,poland', size: 15.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          //about me page
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                text: "the art security for Android,IOS,Web,Linux and Window",
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
          SizedBox(height: 30.0),
          //card page
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SansBold(text: 'What I Do ?', size: 40.0),
              AnimatedCard(
                width: 300.0,
                imagePath: 'assets/images/app.png',
                text: 'App Development',
              ),
              SizedBox(height: 20.0),
              AnimatedCard(
                width: 300.0,
                imagePath: 'assets/images/webL.png',
                text: 'Web Development',
                fit: BoxFit.contain,
                reverse: true,
              ),
              SizedBox(height: 20.0),
              AnimatedCard(
                width: 300.0,
                imagePath: 'assets/images/firebase.png',
                text: 'Back-end Development',
              ),
              SizedBox(height: 30.0),
            ],
          ),
          //contact me page
          ContactMobilePage(),
        ],
      ),
    );
  }
}
