import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/componants.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksWebpage extends StatefulWidget {
  const WorksWebpage({super.key});

  @override
  State<WorksWebpage> createState() => _WorksWebpageState();
}

class _WorksWebpageState extends State<WorksWebpage> {
  urlLauncher(String imagePath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imagePath, width: 35.0, color: Colors.black),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWeb(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/works.jpg',
                  fit: BoxFit.cover,
                  height: 300,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: TabsListView(),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.0),
                SansBold(text: 'Works', size: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/images/portfolio_screenshot.png",
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SansBold(text: 'Portfolio', size: 30.0),
                          SizedBox(height: 10.0),
                          Sans(
                            text:
                                "Deployed on Android,IOS and Web,the portfolio project was truly and achievements.I used Flutter to develop beautiful and responsive UI and Firebase for the back-end.",
                            size: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
