import 'package:flutter/material.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 30,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text('Flutter'),
                      SizedBox(width: 40, child: LinearProgressIndicator()),
                    ],
                  ),
                ),
              ),
              Text('Dart'),
              Text('Python'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Flutter'), Text('Dart'), Text('Python')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Flutter'), Text('Dart'), Text('Python')],
          ),
        ],
      ),
    );
  }
}
