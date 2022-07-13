// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkGmail extends StatefulWidget {
  static String id = 'LinkGmail';
  const LinkGmail({Key? key}) : super(key: key);

  @override
  State<LinkGmail> createState() => _LinkGmailState();
}

class _LinkGmailState extends State<LinkGmail> {
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future _launchUrl({
    required String subject,
    required String message,
  }) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'zehlljael@gmail.com',
      query: encodeQueryParameters(
          <String, String>{'subject': subject, 'body': message}),
    );
    if (!await launchUrl(emailLaunchUri)) throw 'Could not launch application';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Send your inquiries/reports/feedbacks to ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('zehlljael@gmail.com',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  buildTextField(
                      title: 'Subject',
                      controller: controllerSubject,
                      maxLines: 1),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField(
                      title: 'Body', controller: controllerMessage, maxLines: 8),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => _launchUrl(
                      subject: controllerSubject.text,
                      message: controllerMessage.text,
                    ),
                    child: Text('SEND'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Response will be sent after 2-3 business days. Thank you.",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              )),
        ));
  }
}

Widget buildTextField({
  required String title,
  required TextEditingController controller,
  required int maxLines,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
