import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/cards.dart';
import 'package:portfolio_app/connect.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0; // Tracks the active index
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double position = _scrollController.position.pixels;
      setState(() {
        // Update the activeIndex based on the scroll position and container sizes
        if (position >= 0 && position < 650) {
          activeIndex = 0;
        } else if (position >= 650 && position < 950) {
          activeIndex = 1;
        } else if (position >= 1150 && position < 2850) {
          activeIndex = 2;
        } else if (position >= 2840 && position < 3250) {
          activeIndex = 3;
        } else {
          activeIndex = 4;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Open the URL
    } else {
      throw 'Could not launch $url'; // Error if URL can't be launched
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              'images/ezgif.com-crop.png',
              height: 50, // Adjust height as needed
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavItem('About Me', 0),
                  const SizedBox(width: 20),
                  _buildNavItem('Skills', 1),
                  const SizedBox(width: 20),
                  _buildNavItem('Projects', 2),
                  const SizedBox(width: 20),
                  _buildNavItem('Contact Me', 3),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                String url =
                    'https://drive.google.com/drive/folders/1tz8bJD6nlFAi8JQsIuI2oSHXnlhI8rVy?usp=sharing';
                launchURL(url);
              },
              icon: const Icon(Icons.download, color: Colors.white),
              label: Text(
                'Resume',
                style: GoogleFonts.kanit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(7),
                shadowColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container1(),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 1000,
                    width: 500,
                    child: Image.asset(
                      'images/ezgif.com-svg-to-png-converter.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container2(),
            const SizedBox(height: 40),
            Container3(),
            SizedBox(
              height: 30,
            ),
            container4(),
            SizedBox(
              height: 10,
            ),
            connectme(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container container4() {
    return Container(
      //container 4
      width: 600,
      height: 50,
      child: Center(
          child: Text(
        'Connect With Me',
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }

  Container Container3() {
    return Container(
      //container 3
      color: Colors.black,
      height: 1800,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 80,
            width: double.infinity,
            child: Center(
              child: Text(
                'Projects',
                style: GoogleFonts.exo2(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 50),
              height: 500,
              width: 600,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.black,
                elevation: 10,
                shadowColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Image.asset(
                      'images/weather.png',
                      fit: BoxFit.fill,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 550,
                    width: 650,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 500,
              width: 600,
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 600,
                        height: 60,
                        child: Text(
                          '01',
                          style: GoogleFonts.londrinaOutline(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 600,
                        height: 60,
                        child: Text(
                          'Weather App',
                          style: GoogleFonts.kanit(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 600,
                        height: 100,
                        child: Text(
                          'The weather app I created provides real-time weather information by fetching data from the OpenWeatherMap API. It displays essential details like the current weather, humidity, and wind speed in a user-friendly interface. The app helps users stay informed about the weather conditions in their location.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            String url =
                                'https://lavishbhatia-projects.github.io/wahosted/';
                            launchURL(url);
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 520),
                              height: 20,
                              width: 30,
                              child: Icon(Icons.link,
                                  color: Colors.white, size: 30)),
                        ),
                      ),
                    ],
                  )),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50),
                height: 500,
                width: 600,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.black,
                  elevation: 10,
                  shadowColor: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Image.asset(
                        'images/LoginUi.png',
                        fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 550,
                      width: 650,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 500,
                width: 600,
                child: Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 600,
                          height: 60,
                          child: Text(
                            '02',
                            style: GoogleFonts.londrinaOutline(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 600,
                          height: 60,
                          child: Text(
                            'Clean Login Ui',
                            style: GoogleFonts.kanit(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 600,
                          height: 100,
                          child: Text(
                            'The responsive login UI I created adapts seamlessly to different screen sizes, ensuring a smooth user experience across devices. It features an intuitive design with fields for user credentials and visually appealing elements. This project highlights your ability to create functional and user-friendly interfaces in Flutter.',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              String url =
                                  'https://lavishbhatia-projects.github.io/luihosted/';
                              launchURL(url);
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 520),
                                height: 30,
                                width: 100,
                                child: Icon(Icons.link,
                                    color: Colors.white, size: 30)),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 50),
              height: 500,
              width: 600,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.black,
                elevation: 10,
                shadowColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Image.asset(
                      'images/spotify_logo-removebg-preview.png',
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 550,
                    width: 650,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 500,
              width: 600,
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 600,
                        height: 60,
                        child: Text(
                          '03',
                          style: GoogleFonts.londrinaOutline(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 600,
                        height: 60,
                        child: Text(
                          'Spotify Clone',
                          style: GoogleFonts.kanit(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 600,
                        height: 110,
                        child: Text(
                          'The Spotify clone I built follows clean architecture principles, ensuring a well-structured and maintainable codebase. Integrated with Firebase for authentication and storage, it delivers a robust and scalable music management system. This project showcases your expertise in Flutter development and architectural best practices.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 520),
                          height: 10,
                          width: 100,
                          child:
                              Icon(Icons.link, color: Colors.white, size: 30)),
                    ],
                  )),
            ),
          ]),
          SizedBox(
            height: 60,
          ),
          Container(
            width: 600,
            height: 50,
            color: Colors.black,
            child: Center(
                child: Text(
              'And Many More...',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          )
        ],
      ),
    );
  }

  Container Container2() {
    return Container(
      // container 2
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            child: Center(
              child: Text(
                'Skills',
                style: GoogleFonts.exo2(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // CarouselSlider for infinite horizontal scrolling
          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              scrollPhysics:
                  BouncingScrollPhysics(), // For smooth infinite scroll
              viewportFraction: 0.15, // Adjust size of items in the viewport
            ),
            items: [
              MyCard(imagePath: 'images/flutter.png', text: 'Flutter'),
              MyCard(imagePath: 'images/dart.png', text: 'Dart'),
              MyCard(imagePath: 'images/c++.png', text: 'C++'),
              MyCard(imagePath: 'images/python.png', text: 'Python'),
              MyCard(imagePath: 'images/Firebase.png', text: 'Firebase'),
              MyCard(
                  imagePath: 'images/Android Studio.png',
                  text: 'Android Studio'),
              MyCard(imagePath: 'images/VS.png', text: 'Visual Studio'),
              MyCard(imagePath: 'images/R.png', text: 'R programming'),
              MyCard(imagePath: 'images/AWS.png', text: 'AWS'),
              MyCard(imagePath: 'images/Matlab.png', text: 'Matlab'),
              MyCard(
                  imagePath: 'images/android.png', text: 'Android Development'),
            ].map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return card;
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Container Container1() {
    return Container(
      //container 1
      height: 650,
      width: 500,
      margin: const EdgeInsets.fromLTRB(50, 200, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hello',
                style: GoogleFonts.londrinaOutline(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'I Am Lavish',
                style: GoogleFonts.rubik(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 500, // Ensures enough space for both lines
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer',
                  textStyle: GoogleFonts.varelaRound(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Building Interactive Apps',
                  textStyle: GoogleFonts.varelaRound(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'I am an engineering student at TIET Patiala with a strong interest in Flutter development, having worked on various projects. While I have a decent understanding of DSA, I am improving my problem-solving skills and enjoy creating efficient applications while exploring new technologies.',
            style: GoogleFonts.raleway(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;
            });
            // Scroll to the corresponding section based on the updated container sizes
            double offset = 0;
            switch (index) {
              case 0:
                offset = 0;
                break;
              case 1:
                offset = 650;
                break;
              case 2:
                offset = 1150;
                break;
              case 3:
                offset = 2850;
                break;
            }
            _scrollController.animateTo(
              offset,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              text,
              style: GoogleFonts.kanit(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: activeIndex == index ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5), // Space between text and bar
        AnimatedBar(
            active:
                activeIndex == index), // Animated bar directly below the text
      ],
    );
  }
}

class AnimatedBar extends StatelessWidget {
  final bool active;
  const AnimatedBar({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(top: 2),
      height: 4,
      width:
          active ? 20 : 0, // Width animates to 20 or 0 based on active status
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

Column connectme() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Center everything
    children: [
      Container(
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Text(
          'Email: madhugooglu@gmail.com',
          textAlign: TextAlign.center, // Center the email text
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      ),
      SizedBox(height: 30), // Space between email and social media icons
      Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the social media icons row
        children: [
          SocialMediaContainer(
            imagePath: 'images/instagram.png', // Path to your Instagram image
            label: 'Instagram',
            onTap: () {
              String url = 'https://www.instagram.com/_l.a.v.i.sh_/';
              launchURL(url);
            },
          ),
          SizedBox(width: 30),
          SocialMediaContainer(
            imagePath: 'images/discord.png', // Path to your Discord image
            label: 'Discord',
            onTap: () {
              String url =
                  'https://discord.com/channels/456717425551867905/456729060639506432';
              launchURL(url);
            },
          ),
          SizedBox(width: 30),
          SocialMediaContainer(
            imagePath: 'images/linkedin.png', // Path to your LinkedIn image
            label: 'LinkedIn',
            onTap: () {
              String url =
                  'https://www.linkedin.com/in/lavish-bhatia-47b48a2a6/';
              launchURL(url);
            },
          ),
        ],
      ),
    ],
  );
}

class SocialMediaContainer extends StatefulWidget {
  final String imagePath; // Path to the image
  final String label;
  final VoidCallback onTap;

  const SocialMediaContainer({
    required this.imagePath,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _SocialMediaContainerState createState() => _SocialMediaContainerState();
}

class _SocialMediaContainerState extends State<SocialMediaContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(
              color: _isHovered ? Colors.white : Colors.black,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replaced Icon with Image
              Image.asset(
                widget.imagePath,
                width: 40, // Set width and height for the image
                height: 40,
                color: _isHovered
                    ? Colors.white
                    : Colors.black, // Apply color on hover
              ),
              SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: _isHovered ? Colors.white : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url); // Open the URL
  } else {
    throw 'Could not launch $url'; // Error if URL can't be launched
  }
}
