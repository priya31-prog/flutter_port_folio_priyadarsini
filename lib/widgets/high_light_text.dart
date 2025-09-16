import 'package:flutter/material.dart';

Widget highlightedText({
  required BuildContext context,
  required String text,
  required List<String> boldWords,
}) {
  final spans = <TextSpan>[];

  text.splitMapJoin(
    RegExp(boldWords.join('|')),
    onMatch: (m) {
      spans.add(
        TextSpan(
          text: m[0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
      return '';
    },
    onNonMatch: (n) {
      spans.add(TextSpan(text: n));
      return '';
    },
  );

  return Text.rich(
    TextSpan(style: Theme.of(context).textTheme.bodySmall, children: spans),
    // textAlign: TextAlign.center,
  );
}
