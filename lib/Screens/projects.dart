import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidget();
}

class _ProjectWidget extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 80,
                child: Image.asset('images/yono_sbi.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
