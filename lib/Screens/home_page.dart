import 'package:flutter/material.dart';
import 'package:port_folio/Screens/about_journey.dart';
import 'package:port_folio/Screens/contact_page.dart';
import 'package:port_folio/Screens/experience_page.dart';
import 'package:port_folio/Screens/profile_header.dart';
import 'package:port_folio/Screens/projects.dart';
import 'package:port_folio/Screens/skills.dart';
import 'package:port_folio/common_utils.dart';
// import 'package:flutter_application_1/widgets/repaint_boundart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ProfileHeader(),
                AboutJourney(),
                SkillPage(),
                ProjectWidget(projectWidgetParams: ProjectWidgetParams()),
                ExperiencePage(),
                ContactPage(),
                // RepaintBoundaryPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
