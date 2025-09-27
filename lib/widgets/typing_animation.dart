import 'dart:async';
import 'package:flutter/material.dart';
import 'package:port_folio/widgets/high_light_text.dart';

class TypingText extends StatefulWidget {
  final String text;
  final Duration speed;
  final VoidCallback? onCompleted;

  const TypingText({
    super.key,
    required this.text,
    required this.speed,
    this.onCompleted,
  });
  @override
  State<TypingText> createState() => _TypingText();
}

class _TypingText extends State<TypingText> {
  String _display = "";
  int index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.speed, (timer) {
      if (index < widget.text.length) {
        setState(() {
          _display += widget.text[index];
          index++;
        });
      } else {
        timer.cancel();
        widget.onCompleted?.call();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return highlightedText(
      context: context,
      text: _display,
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
    );
  }
}
