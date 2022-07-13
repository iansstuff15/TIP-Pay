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
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
  }



  Future _launchUrl(
    {
      required String subject,
      required String message,
    }
  ) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'zehlljael@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': message
      }),
    );
    if (!await launchUrl(emailLaunchUri)) throw 'Could not launch application';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('To',
              style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold)),
            const SizedBox(height: 8),
            Text('zehlljael@gmail.com',
            style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold)),
            const SizedBox(height: 8),
            buildTextField(title: 'Subject', controller: controllerSubject, maxLines: 1),
            buildTextField(title: 'Body', controller: controllerMessage, maxLines: 8),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _launchUrl(
                                subject: controllerSubject.text,  
                                message: controllerMessage.text,
                            ), 
            child: const Text('SEND'))

          ],
        )
      )
    );
  }
}

Widget buildTextField({
  required String title,
  required TextEditingController controller,
  required int maxLines,
}) => Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: controller,
                maxLines: maxLines,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              )
            ],
);