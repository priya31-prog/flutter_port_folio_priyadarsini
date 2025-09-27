import 'package:flutter/material.dart';
import 'package:port_folio/constants.dart';
import 'package:port_folio/widgets/skill_gridview.dart';

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
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
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
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          skillGridView(
            context: context,
            items: AppConstants().stateManagement,
          ),
          SizedBox(height: 20),
          Text(
            'Tools and PlatForms',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),

          skillGridView(context: context, items: AppConstants().toolsPlatForms),
        ],
      ),
    );
  }
}
