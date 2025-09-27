import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 10),
          Card(
            color: Theme.of(context).colorScheme.secondary.withAlpha(20),
            // elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 60,
                    child: Image.asset('images/tcs_logo.jpg'),
                  ),
                  SizedBox(width: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tata Consultancy Services',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'System Engineer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
