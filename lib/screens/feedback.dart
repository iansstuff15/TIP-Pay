// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/widgets/textFieldArea.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkGmail extends StatefulWidget {
  static String id = 'LinkGmail';
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
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feedbacks',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange),
                  child: Text(
                    "Notice: Response will be sent after 2-3 business days. Thank you.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Input('Subject', TextInputType.text, false, controllerSubject),
                SizedBox(
                  height: 20,
                ),
                TextFieldArea(
                    'Body', TextInputType.text, false, controllerMessage, 8),
                SizedBox(height: 10),
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
              ],
            )),
      )),
    );
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
