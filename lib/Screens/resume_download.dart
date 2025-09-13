import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io' show File;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;

class ResumeDownload {
  static const String resumeUrl =
      'https://drive.google.com/uc?export=download&id=1e7abxKrKWUoPgu7fQzsAh9_TFNf3MgVQ';

  Future<bool> getResume(String filename) async {
    if (kIsWeb) {
      // ✅ Web: just trigger download via <a> tag
      // ignore: unused_local_variable
      final anchor = html.AnchorElement(href: resumeUrl)
        ..setAttribute('download', filename)
        ..click();

      log('Triggered web download for: $filename');
      return true;
    } else {
      try {
        // ✅ Mobile/Desktop: actually fetch and save the file
        final response = await http.get(Uri.parse(resumeUrl));
        final directory = await getApplicationDocumentsDirectory();
        final file = File("${directory.path}/$filename");

        await file.writeAsBytes(response.bodyBytes);

        log('File saved at path: ${file.path}');
        return true;
      } catch (e) {
        log('Error downloading file: $e');
        return false;
      }
    }
  }
}
