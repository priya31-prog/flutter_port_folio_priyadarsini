import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/resume_download.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isTappedOnText = true;
  bool isDownloadedResume = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: UshapeClipper(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 89, 69, 108).withAlpha(150),
                          BlendMode.srcOver,
                        ),
                        image: AssetImage("assets/images/bridge.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    // spacing: 5,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 20,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                              ),
                            ),
                            Text(
                              'Career',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                              ),
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        minRadius: 50,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 5),
                      Text(
                        'Priyadarsini K',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),

                      Text(
                        'Mobile Application Developer',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: const Color.fromARGB(255, 185, 7, 36),
                          ),
                          Text(
                            'Chennai',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade100,
                        child: IconButton(
                          onPressed: () {},

                          icon: Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            InkWell(
              onTap: () {
                setState(() {
                  isTappedOnText = true;
                });
              },
              child: Card(
                elevation: 30,
                margin: EdgeInsets.all(10),
                color: Colors.white.withAlpha(200),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 15,
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        overflow: isTappedOnText
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        maxLines: isTappedOnText ? null : 2,
                        // style: TextStyle(fontSize: 24),
                        "I am a Flutter Developer with 3+ years of experience building "
                        "cross-platform mobile applications. ",
                      ),
                      if (isTappedOnText) ...[
                        SizedBox(height: 5),
                        Text(
                          textAlign: TextAlign.center,
                          'I’ve contributed to large-scale apps '
                          "like SBI YONO and Tata Neu, specializing in Flutter, Dart, MobX, Riverpod, "
                          "and REST APIs. I focus on creating seamless, user-friendly, and high-performance "
                          "digital experiences.",
                        ),
                      ],
                      SizedBox(height: 15),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 30,
                          backgroundColor: const Color.fromARGB(
                            255,
                            89,
                            69,
                            108,
                          ).withAlpha(150),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(3),
                          ),
                        ),
                        onPressed: () {
                          final fileL = generateUniQueString(8);
                          ResumeDownload().getResume("$fileL.pdf");
                          // downloadFileWeb(fileL);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isDownloadedResume
                                  ? Icons.download_done
                                  : Icons.download,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              isDownloadedResume
                                  ? 'Downloaded'
                                  : 'Download Resume',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String generateUniQueString(int length) {
  const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
  Random random = Random();

  return List.generate(
    length,
    (index) => chars[random.nextInt(chars.length)],
  ).join();
}

class UshapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    //current point (can be moveTo)
    path.lineTo(0, size.height * 0.8);
    //left u curve
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height,
    );

    //left u curve
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
