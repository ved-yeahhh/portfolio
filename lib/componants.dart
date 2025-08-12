import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({super.key, required this.title, required this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.of(context).pushNamed(widget.route)},
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (event) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          curve: Curves.elasticInOut,
          duration: Duration(milliseconds: 100),
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -8))],
                  color: Colors.transparent,
                  fontSize: 25.0,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent,
                )
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(
            widget.title,
            // style: GoogleFonts.oswald(color: Colors.black, fontSize: 23.0),
          ),
        ),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final String text;
  final double size;
  const SansBold({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  const Sans({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final Fontweight;

  const AbelCustom({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.Fontweight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: Fontweight ?? FontWeight.normal,
      ),
    );
  }
}

class CommanTextField extends StatelessWidget {
  final String labelText;
  final maxLine;
  final double width;
  final controller;
  final validator;

  const CommanTextField({
    super.key,
    required this.labelText,
    this.maxLine = 1,
    required this.width,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SizedBox(
              width: width,
              child: TextFormField(
                maxLines: maxLine,
                validator: validator,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                  labelText: labelText,
                ),
                controller: controller,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.1) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.1),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200,
                width: widget.width ?? 200,
                fit: widget.fit,
              ),
              SizedBox(height: 10),
              widget.text == null
                  ? SizedBox()
                  : Sans(text: widget.text, size: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}

class AddDataFirestore {
  CollectionReference response = FirebaseFirestore.instance.collection(
    'messages',
  );
  var logger = Logger();
  Future addResponse(
    final firstname,
    final lastname,
    final emial,
    final phone,
    final message,
  ) {
    return response
        .add({
          'first name': firstname,
          'last name': lastname,
          'emial address': emial,
          'phone number': phone,
          'message': message,
        })
        .then((value) {
          logger.d('success');
          return true;
        })
        .catchError((error) {
          logger.d('failure');
          return false;
        });
  }
}

Future dialogError(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        title: Sans(text: title, size: 20.0),
      );
    },
  );
}

class TabsListView extends StatefulWidget {
  const TabsListView({super.key});

  @override
  State<TabsListView> createState() => _TabsListViewState();
}

class _TabsListViewState extends State<TabsListView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 3),
        TabsWeb(title: "Home", route: '/home'),
        Spacer(),
        TabsWeb(title: "Works", route: '/works'),
        Spacer(),
        TabsWeb(title: "Blog", route: '/blog'),
        Spacer(),
        TabsWeb(title: "About", route: '/about'),
        Spacer(),
        TabsWeb(title: "Contact", route: '/contact'),
        Spacer(),
      ],
    );
  }
}

urlLauncher(String imagePath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imagePath, width: 35.0, color: Colors.black),
    onPressed: () async {
      await launchUrl(Uri.parse(url));
    },
  );
}

class DrawerWeb extends StatelessWidget {
  const DrawerWeb({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 73,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
          SizedBox(height: 10),
          SansBold(text: 'Vedant Jagtap', size: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher(
                'assets/images/instagram.svg',
                'https://www.instagram.com/tomcruise/',
              ),
              urlLauncher(
                'assets/images/twitter.svg',
                'https://x.com/tomcruise',
              ),
              urlLauncher(
                'assets/images/github.svg',
                'https://github.com/ved-yeahhh',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
          TabsMobile(text: 'Home', route: '/'),
          SizedBox(height: 20.0),
          TabsMobile(text: 'Works', route: '/works'),
          SizedBox(height: 20.0),
          TabsMobile(text: 'Blogs', route: '/blog'),
          SizedBox(height: 20.0),
          TabsMobile(text: 'About', route: '/about'),
          SizedBox(height: 20.0),
          TabsMobile(text: 'Contact', route: '/contact'),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              urlLauncher(
                'assets/images/instagram.svg',
                'https://www.instagram.com/tomcruise/',
              ),
              urlLauncher(
                'assets/images/twitter.svg',
                'https://x.com/tomcruise',
              ),
              urlLauncher(
                'assets/images/github.svg',
                'https://github.com/ved-yeahhh',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactWebPage extends StatefulWidget {
  const ContactWebPage({super.key});

  @override
  State<ContactWebPage> createState() => _ContactWebPageState();
}

class _ContactWebPageState extends State<ContactWebPage> {
  final logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SansBold(text: 'Contact me', size: 40),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommanTextField(
                    labelText: 'First Name',
                    width: 350,
                    controller: _firstNameController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'FirstName is required';
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  CommanTextField(
                    labelText: 'Email',
                    width: 350,
                    controller: _emailController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'email is required';
                      }
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommanTextField(
                    labelText: 'Last Name',
                    width: 350,
                    controller: _lastNameController,
                  ),
                  SizedBox(height: 15),
                  CommanTextField(
                    labelText: 'phone Number',
                    width: 350,
                    controller: _phoneController,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          CommanTextField(
            labelText: 'Messsage',
            width: widthDevice / 1.5,
            maxLine: 7,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'message is required';
              }
            },
          ),
          SizedBox(height: 30),
          MaterialButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                var addData = AddDataFirestore();
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  dialogError(context, "messsage send successfuly");
                } else {
                  dialogError(context, "Failed to send message");
                }
              }
            },
            color: Colors.tealAccent,
            height: 60,
            minWidth: 200,
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: SansBold(text: 'Submit', size: 20),
          ),
        ],
      ),
    );
  }
}

class ContactMobilePage extends StatefulWidget {
  const ContactMobilePage({super.key});

  @override
  State<ContactMobilePage> createState() => _ContactMobilePageState();
}

class _ContactMobilePageState extends State<ContactMobilePage> {
  final logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthdevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        alignment: WrapAlignment.center,
        children: [
          SansBold(text: 'Contact Me', size: 40),
          CommanTextField(
            labelText: 'First Name',
            width: widthdevice / 1.4,
            controller: _firstNameController,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'FirstName is required';
              }
            },
          ),
          CommanTextField(
            labelText: 'Last Name',
            width: widthdevice / 1.4,
            controller: _lastNameController,
          ),
          CommanTextField(
            labelText: 'Email Adress',
            width: widthdevice / 1.4,
            controller: _emailController,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'email is required';
              }
            },
          ),
          CommanTextField(
            labelText: 'Phone Number',
            width: widthdevice / 1.4,
            controller: _phoneController,
          ),
          CommanTextField(
            labelText: 'Message',
            width: widthdevice / 1.4,
            maxLine: 5,
            controller: _messageController,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'message is required';
              }
            },
          ),
          MaterialButton(
            onPressed: () async {
              var addData = AddDataFirestore();
              if (await addData.addResponse(
                _firstNameController.text,
                _lastNameController.text,
                _emailController.text,
                _phoneController.text,
                _messageController.text,
              )) {
                formKey.currentState!.reset();
                dialogError(context, "messsage send successfuly");
              } else {
                dialogError(context, "Failed to send message");
              }
            },
            color: Colors.tealAccent,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),

              side: BorderSide(
                style: BorderStyle.solid,
                color: Colors.tealAccent,
              ),
            ),
            child: SansBold(text: 'Submit', size: 20),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
