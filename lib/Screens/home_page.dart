import 'package:flutter/material.dart';
import 'package:port_folio/Screens/about_journey.dart';
import 'package:port_folio/Screens/contact_page.dart';
import 'package:port_folio/Screens/experience_page.dart';
import 'package:port_folio/Screens/profile_header.dart';
import 'package:port_folio/Screens/projects.dart';
import 'package:port_folio/Screens/skills.dart';
import 'package:port_folio/common_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey _contactPage = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ProfileHeader(
                  getScrollable: () {
                    final cxt = _contactPage.currentContext;
                    if (cxt != null) {
                      Scrollable.ensureVisible(
                        cxt,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                AboutJourney(),
                SkillPage(),
                ProjectWidget(projectWidgetParams: ProjectWidgetParams()),
                ExperiencePage(),
                ContactPage(key: _contactPage),
                // RepaintBoundaryPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
