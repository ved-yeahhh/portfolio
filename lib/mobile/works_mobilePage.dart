import 'package:flutter/material.dart';
import 'package:portfolio/componants.dart';

class WorksMobilepage extends StatefulWidget {
  const WorksMobilepage({super.key});

  @override
  State<WorksMobilepage> createState() => _WorksMobilepageState();
}

class _WorksMobilepageState extends State<WorksMobilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: DrawerMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(size: 20, color: Colors.black),
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/works.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 20.0),
                SansBold(text: "Works", size: 20),
                SizedBox(height: 20.0),
                AnimatedCard(
                  imagePath: 'assets/images/portfolio_screenshot.png',
                  fit: BoxFit.cover,
                  height: 150.0,
                  width: 250.0,
                ),
                SizedBox(height: 20.0),
                SansBold(text: 'Portfolio', size: 20.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Sans(
                    text:
                        "Deployed on Android,IOS and Web,the portfolio project was truly and achievements.I used Flutter to develop beautiful and responsive UI and Firebase for the back-end.",
                    size: 15.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
