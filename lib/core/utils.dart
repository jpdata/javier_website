import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static double screenHzRelation(BuildContext context) => MediaQuery.of(context).size.width / 1920;
  static double screenVtRelation(BuildContext context) => MediaQuery.of(context).size.height / 1080;
  static double adjustToScreenHzRel(BuildContext context, double value) => value * screenHzRelation(context);
  static double adjustToScreenVtRel(BuildContext context, double value) => value * screenVtRelation(context);

  static double mediaWidthPercent(BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * percent / 100;

  static double mediaHeightPercent(BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * percent / 100;

  static Future<void> launchMailto(BuildContext context) async {
    var subject = localizations.contact_me;
    var body = localizations.contact_me_body;
    final Uri params = Uri(
      scheme: 'mailto',
      path: "jpdata@gmail.com",
      query: 'subject=$subject&body=$body',
    );

    final url = params.toString();
    final uri = Uri.tryParse(url) ?? Uri();
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      //throw 'Could not launch $url';
      //add snakcbar with message
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch $url', style: const TextStyle(color: Colors.white)),
          ),
        );
      }
    }
  }

  static Future<void> launchURL(String url) async {
    final uri = Uri.tryParse(url) ?? Uri();
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static final List<Flushbar> flushBars = [];

  static void showSnackBar(
    BuildContext context, {
    required String text,
    required Color color,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      )));
}
