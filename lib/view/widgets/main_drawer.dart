import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

    Future<void> _launchMailto() async {
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
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(localizations.drawer_header),
            ),
            ListTile(
              title:  Text(localizations.contact_me_with_email),
              onTap: () {
                _launchMailto();
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                context.push('/item2');
              },
            ),
          ],
        ),
      );
  }
}