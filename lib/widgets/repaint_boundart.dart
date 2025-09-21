import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Screens/projects.dart';
import 'package:flutter_application_1/common_utils.dart';
import 'package:flutter_application_1/widgets/high_light_text.dart';
import 'package:flutter_application_1/widgets/mobile_project_view.dart';

class RepaintBoundaryPage extends StatefulWidget {
  const RepaintBoundaryPage({super.key});

  @override
  State<RepaintBoundaryPage> createState() => _RepaintBoundaryState();
}

class _RepaintBoundaryState extends State<RepaintBoundaryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Priyadarsini K',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          Text('Flutter Application Developer'),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: highlightedText(
              boldWords: [
                '3+ years',
                'fintech and lifestyle',
                'Tata Consultancy Services',
                'SBI YONO',
                'Tata Neu',
                'Agile environments',
                'high-quality',
              ],
              context: context,
              text:
                  'I’m a Flutter Developer with 3+ years of experience building fintech and lifestyle applications that impact millions of users.\n\nAt Tata Consultancy Services, I’ve contributed to flagship apps like SBI YONO and Tata Neu, delivering complex payment modules, enhancing app performance, and resolving critical defects with a strong focus on UI/UX, security, and reliability.\n\nI thrive in Agile environments, collaborating with teams across development, QA, and product to deliver scalable and high-quality mobile solutions.',
            ),
          ),
          SizedBox(height: 15),

          ProjectWidget(
            projectWidgetParams: ProjectWidgetParams(
              pageNav: ProjectPageNav.rePaintBoundary,
            ),
          ),
        ],
      ),
    );
  }
}
