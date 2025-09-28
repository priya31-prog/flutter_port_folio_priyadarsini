import 'package:url_launcher/url_launcher.dart';

class ContactUrls {
  Future<void> launchWebUrl({required String urlName}) async {
    final Uri url = Uri.parse(urlName);
    if (!await launchUrl(url)) {}
  }

  Future<void> launchMail(String mail) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'priyadarsinik31@gmail.com',
      query: 'Regarding recruitment',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> launchDialer(String mobile) async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: mobile);
    if (await canLaunchUrl(phoneUrl)) {
      launchUrl(phoneUrl);
    }
  }
}
