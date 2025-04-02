import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_html_all/flutter_html_all.dart';

class EntryDetailPage extends StatelessWidget {
  final Entry entry;

  const EntryDetailPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 8),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * .80,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (entry.bannerImageUrl.isNotEmpty)
                      FutureBuilder(
                        future: _buildFirestorageFromImageName(
                            entry.id, entry.bannerImageUrl),
                        builder: (context, snapshot) => snapshot.hasData
                            ? Image.network(snapshot.data.toString())
                            : const CircularProgressIndicator(),
                      ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                entry.title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                entry.subtitle,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Html(
                              data: entry.content,
                              style: {
                                "body": Style(
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                ),
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const Row(
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...entry.comments.map((comment) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 16),
                                      child: ListTile(
                                        title: Text(
                                          localizations.comment_title(
                                              comment.authorName,
                                              comment.createdAt),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        subtitle: Text(
                                          comment.content,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para crear una nueva entrada
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text('Editar entrada'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<String?> _buildFirestorageFromImageName(
      String entryId, String imageName) async {
    try {
      // Referencia al archivo en Firebase Storage
      final ref =
          FirebaseStorage.instance.ref().child('blog/$entryId/$imageName');

      // Obtener la URL de descarga
      var url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      developer
          .log('Error obteniendo la URL de la imagen($entryId/$imageName): $e');
    }
    return null;
  }
}
