import 'package:flutter/material.dart';
import 'package:portfolio/common_blog_page.dart';
import 'package:portfolio/mobile/about_mobilepage.dart';
import 'package:portfolio/mobile/contact_page_mobile.dart';
import 'package:portfolio/mobile/landing_page_mobile.dart';
import 'package:portfolio/mobile/works_mobilePage.dart';
import 'package:portfolio/web/about_webpage.dart';
import 'package:portfolio/web/contact_page_web.dart';
import 'package:portfolio/web/landing_page_web.dart';
import 'package:portfolio/web/works_webpage.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth > 800) {
                return ContactPageWeb();
              } else {
                return ContactPageMobile();
              }
            },
          ),
        );
      case '/about':
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth > 800) {
                return AboutWebpage();
              } else {
                return AboutMobilepage();
              }
            },
          ),
        );
      case '/blog':
        return MaterialPageRoute(builder: (_) => CommonBlogPage());
      case '/works':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth > 800) {
                return WorksWebpage();
              } else {
                return WorksMobilepage();
              }
            },
          ),
        );
      default:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
