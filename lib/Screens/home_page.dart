import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/about_content.dart';
import 'package:flutter_application_1/Screens/profile_banner.dart';
import 'package:flutter_application_1/widgets/clip_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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

                profileBanner(context),
              ],
            ),

            SizedBox(height: 30),
            aboutContent(context),
          ],
        ),
      ),
    );
  }
}
