import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_utils.dart';
import 'package:flutter_application_1/widgets/get_resume_btn.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 15,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Priyadarsini K',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text('Flutter Application Developer'),
              SizedBox(height: 15),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Building seamless mobile journeys with Flutter',
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),

                    WidgetSpan(
                      child: Icon(Icons.rocket_launch_outlined, size: 13),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  getDownloadButton(context),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(5),

                      shape: BoxShape.rectangle,
                    ),
                    child: Text(
                      'Contact Me',
                      style: TextStyle(
                        fontSize: 12,
                        // color: Colors.white,
                      ),
                    ),
                  ),

                  if (!kIsWeb)
                    if (Platform.isAndroid)
                      IconButton(
                        onPressed: () {
                          captureController.add(null);
                        },
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.share,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(width: 10),
                            Text('Share Profile'),
                          ],
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('images/flutter_dev.jpg'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
