import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/about_journey.dart';
import 'package:flutter_application_1/Screens/profile_header.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            // mainAxisSize: MainAxisSize.min,
            children: [ProfileHeader(), AboutJourney()],
          ),
        ),
      ),
    );
  }
}
