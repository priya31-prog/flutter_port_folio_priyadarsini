import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/high_light_text.dart';

class AboutJourney extends StatefulWidget {
  const AboutJourney({super.key});

  @override
  State<AboutJourney> createState() => _AboutJourney();
}

class _AboutJourney extends State<AboutJourney> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Journey',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            bool isSmallScreen = constraints.maxWidth < 500;
            if (isSmallScreen) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [timeLine(context), buildText(context)],
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: timeLine(context)),
                    SizedBox(width: 20),
                    Expanded(child: buildText(context)),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

Widget buildText(BuildContext context) {
  return highlightedText(
    context: context,
    text:
        'I’m a Flutter Developer with 3+ years of experience building fintech and lifestyle applications that impact millions of users.\n\nAt Tata Consultancy Services, I’ve contributed to flagship apps like SBI YONO and Tata Neu, delivering complex payment modules, enhancing app performance, and resolving critical defects with a strong focus on UI/UX, security, and reliability.\n\nI thrive in Agile environments, collaborating with teams across development, QA, and product to deliver scalable and high-quality mobile solutions.\n\n I’m passionate about creating seamless, user-friendly digital experiences while continuously learning and refining my craft.',
    boldWords: [
      'Flutter Developer',
      '3+ years',
      'Tata Consultancy',
      'SBI YONO',
      'Tata Neu',
      'UI/UX',
      'Agile environments',
    ],
  );
  // return RichText(
  //   // textAlign: TextAlign.center,
  //   text: TextSpan(
  //     style: Theme.of(context).textTheme.bodySmall,

  //     children: [
  //       TextSpan(
  //         text:
  //             'I’m a Flutter Developer with 3+ years of experience building fintech and lifestyle applications that impact millions of users. At Tata Consultancy Services, I’ve contributed to flagship apps like SBI YONO and Tata Neu, delivering complex payment modules, enhancing app performance, and resolving critical defects with a strong focus on UI/UX, security, and reliability.\n\n',
  //       ),

  //       TextSpan(
  //         text:
  //             ' I specialize in Flutter, Dart, MobX, Riverpod, and REST APIs, with hands-on expertise in cross-platform mobile development, state management, and payment integrations (UPI, cards, merchant solutions). I thrive in Agile environments, collaborating with teams across development, QA, and product to deliver scalable and high-quality mobile solutions.\n\n',
  //       ),
  //       TextSpan(
  //         text:
  //             'Recognized as a Star Performer (2024) for resolving 40% of critical application bugs, I’m passionate about creating seamless, user-friendly digital experiences while continuously learning and refining my craft.\n\n',
  //       ),
  //     ],
  //   ),
  // );
}

Widget timeLine(BuildContext context) {
  final List<IconData> icons = [
    Icons.school_outlined,
    Icons.shopping_cart_outlined,
    Icons.payment_outlined,
  ];

  final List<String> year = ['2018-2022', '2022-2023 - TCS', 'Current - TCS'];

  final List<String> title = [
    'Anna University',
    'Worked on Tata Neu Super App',
    'Contributing to SBI YONO (UPI module)',
  ];
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) {
      return buildAbout(
        context: context,
        icon: icons[index],
        title: title[index],
        year: year[index],
      );
    },
  );
}

Widget buildAbout({
  required BuildContext context,
  required IconData icon,
  required String year,
  required String title,
}) {
  return Column(
    children: [
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(icon),
              Container(height: 80, width: 2, color: Colors.grey),
            ],
          ),
          SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(year, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(title, softWrap: true, overflow: TextOverflow.visible),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
