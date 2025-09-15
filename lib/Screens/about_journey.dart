import 'package:flutter/material.dart';

class AboutJourney extends StatefulWidget {
  const AboutJourney({super.key});

  @override
  State<AboutJourney> createState() => _AboutJourney();
}

class _AboutJourney extends State<AboutJourney> {
  final List<IconData> icons = [
    Icons.school_outlined,
    Icons.shopping_cart_outlined,
    Icons.payment_outlined,
  ];

  final List<String> year = ['2018-2022', '2022-2023', 'Current'];

  final List<String> title = [
    'Anna University',
    'Worked on Tata Neu Super App',
    'Contributing to SBI YONO (UPI module)',
  ];
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
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
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Text(
                    'In today’s fast-paced digital world, technology continues to evolve at an incredible rate, shaping the way people communicate, work, and solve problems. Mobile applications have become a central part of daily life, offering convenience, speed, and endless possibilities for businesses and individuals alike. Developers play a key role in this transformation, combining creativity with technical skills to build solutions that truly make an impact. From designing user-friendly interfaces to integrating powerful backend systems, every step requires precision and innovation. The journey of learning, experimenting, and improving never ends, making software development both challenging and deeply rewarding.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
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
              Container(height: 50, width: 2, color: Colors.grey),
            ],
          ),
          SizedBox(width: 15),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(year, style: TextStyle(fontWeight: FontWeight.bold)),
                // WidgetSpan(child: SizedBox(height: 10)),
                Text(title),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
