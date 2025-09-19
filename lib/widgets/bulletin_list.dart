import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/high_light_text.dart';
import 'package:flutter_application_1/widgets/typing_animation.dart';

Widget listTiles({
  required BuildContext context,
  required String text,
  IconData? icon,
  required bool isActive,
  VoidCallback? onFinished,
  required bool isCompleted,
}) {
  return Row(
    spacing: 15,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsetsGeometry.only(top: 5),
        child: isCompleted
            ? Icon(icon ?? Icons.circle, size: 8)
            : SizedBox.shrink(),
      ),
      Expanded(
        child: isActive
            ? TypingText(
                text: text,
                speed: Duration(milliseconds: 15),
                onCompleted: onFinished,
              )
            : isCompleted
            ? highlightedText(
                context: context,
                text: text,
                boldWords: [
                  'MobX',
                  'navigation',
                  'responsiveness',
                  'performance',
                  '20%',
                  'bug triaging',
                  'RCA',
                  'technical debt',
                ],
              )
            : const SizedBox.shrink(),
        // Text(text, softWrap: true, overflow: TextOverflow.visible),
      ),
    ],
  );
}
