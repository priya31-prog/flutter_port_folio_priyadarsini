import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/widgets/skill_gridview.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPage();
}

class _SkillPage extends State<SkillPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        // spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Skills',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          skillGridView(
            context: context,
            items: AppConstants().skills,
            percentages: AppConstants().skillsPercent,
          ),
          SizedBox(height: 20),
          Text(
            'State Management',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          skillGridView(
            context: context,
            items: AppConstants().stateManagement,
          ),
          SizedBox(height: 20),
          Text(
            'Tools and PlatForms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          skillGridView(context: context, items: AppConstants().toolsPlatForms),
        ],
      ),
    );
  }
}
