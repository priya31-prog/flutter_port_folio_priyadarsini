import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/state_managements_skills.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPage();
}

class _SkillPage extends State<SkillPage> {
  final List<String> skills = [
    'Flutter',
    'Dart',
    'Python',
    'Django Rest Framework',
    'GitHub',
    'Firebase',
  ];

  final List<double> skillsPercent = [0.8, 0.9, 0.8, 0.7, 0.7, 0.6];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2,
              mainAxisExtent: 100,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          skills[index],
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),

                      SizedBox(height: 5),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0,
                          end: skillsPercent[index],
                        ),
                        duration: const Duration(seconds: 5),
                        builder: (context, value, _) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: 5,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            'State Management',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          stateManagement(context),
        ],
      ),
    );
  }
}
