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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          skillGridView(
            context: context,
            items: AppConstants().skills,
            percentages: AppConstants().skillsPercent,
          ),

          Text(
            'State Management',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          skillGridView(
            context: context,
            items: AppConstants().stateManagement,
          ),
          Text(
            'Tools and PlatForms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          skillGridView(context: context, items: AppConstants().toolsPlatForms),
        ],
      ),
    );
  }
}
