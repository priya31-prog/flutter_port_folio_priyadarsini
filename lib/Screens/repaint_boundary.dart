import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:port_folio/Screens/projects.dart';
import 'package:port_folio/common_utils.dart';
import 'package:port_folio/widgets/high_light_text.dart';
import 'package:port_folio/widgets/repaint_boundary_contact.dart';
import 'package:universal_html/html.dart' as html;

class RepaintBoundaryPage extends StatefulWidget {
  const RepaintBoundaryPage({super.key});

  @override
  State<RepaintBoundaryPage> createState() => _RepaintBoundaryState();
}

class _RepaintBoundaryState extends State<RepaintBoundaryPage> {
  final GlobalKey boundary = GlobalKey();

  @override
  void initState() {
    super.initState();

    captureController.stream.listen((_) {
      captureImage();
    });
  }

  Future<void> captureImage() async {
    try {
      RenderRepaintBoundary boundaryRendered =
          boundary.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundaryRendered.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      // log('Print platform ${kIsWeb}');
      // Save the image to a file
      if (Platform.isAndroid) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/screenshot.png');
        await file.writeAsBytes(pngBytes);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Screenshot saved to ${file.path}')),
        );
      }
    } catch (e) {
      log('Error -----$e');
    }
  }

  Future<void> downloadImageWeb(Uint8List pngBytes, String fileName) async {
    final blob = html.Blob([pngBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    // ignore: unused_local_variable
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: boundary,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            RepaintContact(),
          ],
        ),
      ),
    );
  }
}
