import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_application_1/widgets/high_light_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget project({
  required BuildContext context,
  required String imageString,
  required String projectTitle,
  required String company,
  required String position,
  required bool isSbi,
  required VoidCallback onTap,
  required Widget childIcon,
  required bool isExpanded,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
    decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              spacing: 15,
              children: [
                SizedBox(
                  height: 70,
                  width: 80,
                  child: Image.asset(imageString),
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall,
                    // style: TextStyle(fontSize: 12),
                    children: [
                      TextSpan(
                        text: projectTitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(height: 22)),
                      TextSpan(text: company),
                      TextSpan(text: position),
                    ],
                  ),
                ),

                // Text('SBI YONO(UPI)'),
              ],
            ),
            InkWell(onTap: onTap, child: childIcon),
          ],
        ),
        if (isExpanded && !isSbi) ...[
          SizedBox(height: 15),
          highlightedText(
            context: context,
            text:
                'Tata Neu is a lifestyle and travel super app serving millions of'
                'users across India. It brings together shopping, travel,'
                'and payment experiences into one seamless platform.',
            boldWords: ['shopping', 'travel', 'payment'],
          ),
          SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: AppConstants().tataNeuDes.length,
            itemBuilder: (context, index) {
              return listTiles(
                context: context,
                text: AppConstants().tataNeuDes[index],
              );
            },
          ),
        ],
      ],
    ),
  );
}

Widget listTiles({
  required BuildContext context,
  required String text,
  IconData? icon,
}) {
  return Row(
    spacing: 15,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsetsGeometry.only(top: 5),
        child: Icon(icon ?? Icons.circle, size: 8),
      ),
      Expanded(
        child: Text(text, softWrap: true, overflow: TextOverflow.visible),
      ),
    ],
  );
}
