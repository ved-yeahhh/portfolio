import 'package:flutter/material.dart';
import 'package:portfolio/componants.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Sans(text: text, size: 15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWeb(),
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
        scrollDirection: Axis.vertical,
        children: [
          //First Section
          SizedBox(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: SansBold(size: 15, text: "hello I'm"),
                      ),
                    ),
                    SansBold(text: "Vedant Jagtap", size: 55.0),
                    Sans(text: "Flutter developer", size: 30.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 10),
                        Sans(text: "jvedant2109@gmail.com", size: 15.0),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 10),
                        Sans(text: "+344 233 433", size: 15.0),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 10),
                        Sans(text: "13/3, zczcin,poland", size: 15.0),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 350),
                CircleAvatar(
                  radius: 146,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 142,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //second Section
          SizedBox(
            height: heightDevice / 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/web.jpg', height: widthDevice / 1.9),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SansBold(text: "About me", size: 40.0),
                    SizedBox(height: 15),
                    Sans(
                      text:
                          "Hello! I'm Vedant jagtap I specialize in flutter development ",
                      size: 15,
                    ),
                    Sans(
                      text:
                          "I strive to ensure outstanding performance with state of ",
                      size: 15,
                    ),
                    Sans(
                      text:
                          "the art security for Android,IOS,Web,Linux and Window",
                      size: 15,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        tealContainer('flutter'),
                        SizedBox(width: 8.0),
                        tealContainer('Firebase'),
                        SizedBox(width: 8.0),
                        tealContainer('Android'),
                        SizedBox(width: 8.0),
                        tealContainer('IOS'),
                        SizedBox(width: 8.0),
                        tealContainer('Windows'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Third Section
          SizedBox(
            height: heightDevice / 1.5,
            child: Column(
              children: [
                SansBold(text: 'What I do?', size: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/images/app.png',
                      text: 'App Development',
                    ),
                    SizedBox(height: 10),
                    AnimatedCard(
                      imagePath: 'assets/images/webL.png',
                      text: 'Web Development',
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    SizedBox(height: 10),
                    AnimatedCard(
                      imagePath: 'assets/images/firebase.png',
                      text: 'Back-end Development',
                    ),
                  ],
                ),
              ],
            ),
          ),
          //fourth section
          SizedBox(
            height: heightDevice,
            child: SingleChildScrollView(child: ContactWebPage()),
          ),
        ],
      ),
    );
  }
}
