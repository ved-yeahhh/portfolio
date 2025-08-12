import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/componants.dart';

class CommonBlogPage extends StatefulWidget {
  const CommonBlogPage({super.key});

  @override
  State<CommonBlogPage> createState() => _CommonBlogPageState();
}

class _CommonBlogPageState extends State<CommonBlogPage> {
  @override
  Widget build(BuildContext context) {
    bool isweb = MediaQuery.of(context).size.width > 800;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: DrawerMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: isweb ? false : true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: AbelCustom(
                      text: 'Welcome to my blog',
                      size: isweb ? 30.0 : 24.0,
                      color: Colors.white,
                      Fontweight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    'assets/images/blog.jpg',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: isweb ? 500.0 : 400.0,
              ),
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('article')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return BlogPost(
                      title: documentSnapshot['title'],
                      body: documentSnapshot['body'],
                      isweb: isweb,
                    );
                  },
                );
              } else {
                return Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class BlogPost extends StatefulWidget {
  final String title;
  final String body;
  final bool isweb;
  const BlogPost({
    super.key,
    required this.title,
    required this.body,
    required this.isweb,
  });

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isweb
          ? EdgeInsetsGeometry.only(
              left: 70.0,
              right: 70.0,
              top: 40,
              bottom: 40,
            )
          : EdgeInsetsGeometry.only(
              left: 20.0,
              right: 20.0,
              top: 30,
              bottom: 30,
            ),
      child: Container(
        padding: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: widget.title,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              widget.body,
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand == true ? null : 3,
              overflow: expand == true
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
