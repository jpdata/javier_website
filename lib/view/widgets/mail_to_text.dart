import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailToText extends StatelessWidget {
  const MailToText({
    super.key,
    required this.email,
    required this.subject,
    required this.body,
  });

  final String body;
  final String email;
  final String subject;

  Future<void> _launchMailto() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject&body=$body',
    );

    final url = params.toString();
    final uri = Uri.tryParse(url) ?? Uri();
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchMailto,
      child: const Text(
        'Send Email',
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}