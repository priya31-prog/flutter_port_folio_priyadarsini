import 'package:flutter/material.dart';
import 'package:port_folio/function_calls/contact_urls.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 15),
          Column(
            children: [
              Text(
                "I'd like to here from you",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline),
                  SizedBox(width: 15),
                  TextButton(
                    onPressed: () {
                      ContactUrls().launchMail('priyadarsinik31@gmail.com');
                    },
                    child: Text(
                      'priyadarsinik31@gmail.com',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(Icons.thumb_up_alt_outlined),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      ContactUrls().launchWebUrl(
                        urlName:
                            'https://www.hackerrank.com/profile/priyadarsinik31',
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      width: 30,
                      child: Image.asset('assets/images/hacker_rank_logo.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ContactUrls().launchWebUrl(
                        urlName:
                            'https://www.linkedin.com/in/priyadarsini-k-b74832213/',
                      );
                    },
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/linked_in_logo.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ContactUrls().launchWebUrl(
                        urlName: 'https://github.com/priya31-prog',
                      );
                    },
                    child: SizedBox(
                      height: 20,
                      width: 30,
                      child: Image.asset('assets/images/git_hub_logo.jpg'),
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call),
                  SizedBox(width: 15),
                  TextButton(
                    onPressed: () {
                      ContactUrls().launchDialer('+917708309962');
                    },
                    child: Text('+91 7708309962'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
