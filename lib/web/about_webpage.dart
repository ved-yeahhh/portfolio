import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/componants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWebpage extends StatefulWidget {
  const AboutWebpage({super.key});

  @override
  State<AboutWebpage> createState() => _AboutWebpageState();
}

class _AboutWebpageState extends State<AboutWebpage> {
  urlLauncher(String imagePath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imagePath, width: 35.0, color: Colors.black),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

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
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: const Color.fromRGBO(0, 0, 0, 1),
          size: 25.0,
        ),
        title: TabsListView(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Sans(
                      text:
                          "Hello! I'm Vedant jagtap I specialize in flutter development ",
                      size: 20.0,
                    ),
                    Sans(
                      text:
                          "I strive to ensure outstanding performance with state of ",
                      size: 20.0,
                    ),
                    Sans(
                      text:
                          "the art security for Android,IOS,Web,Linux and Window",
                      size: 20.0,
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
                CircleAvatar(
                  radius: 124,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'assets/images/app.png',
                text: 'App Development',
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "App Development", size: 20),
                    SizedBox(height: 20),
                    Sans(
                      text:
                          " Do you need a high-performance,responsive &  beautiful app? Don't worry,I've got you covered",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "App Development", size: 20),
                    SizedBox(height: 20),
                    Sans(
                      text:
                          " I'm here to build your presence online with state of the art web apps",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                reverse: true,
                imagePath: 'assets/images/webL.png',
                text: 'Web Development',
                height: 250.0,
                width: 250.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'assets/images/firebase.png',
                text: 'Back-end Development',
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "Back-end  Development", size: 20),
                    SizedBox(height: 20),
                    Sans(
                      text:
                          " Do you want your back-end to be highly scalable & secure ? Lets have a conversation on how  I can help you with that",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
