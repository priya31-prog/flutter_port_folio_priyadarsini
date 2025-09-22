import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static String generateUniQueString(int length) {
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    Random random = Random();

    return List.generate(
      length,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
  }
}

class ProjectArgs {
  final String imageString;
  final String projectTitle;
  final String company;
  final String position;
  final bool isSbi;
  final VoidCallback onTap;
  final Widget childIcon;
  final bool isExpanded;
  final ProjectPageNav projectPageNav;

  ProjectArgs({
    required this.childIcon,
    required this.company,
    required this.imageString,
    required this.isExpanded,
    required this.isSbi,
    required this.onTap,
    required this.position,
    required this.projectTitle,
    required this.projectPageNav,
  });
}

class ProjectWidgetParams {
  final ProjectPageNav pageNav;

  ProjectWidgetParams({this.pageNav = ProjectPageNav.normal});
}

enum ProjectPageNav { rePaintBoundary, normal }

final captureController = StreamController<void>.broadcast();
