import 'dart:developer' as developer;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/themes/app_theme.dart';

class EntryDetailWidget extends StatelessWidget {
  final Entry entry;
  final bool showEditEntryButton;

  const EntryDetailWidget({super.key, required this.entry, this.showEditEntryButton = false});

  @override
  Widget build(BuildContext context) {
    return _entryRawContent(
      MediaQuery.of(context).size.width,
      entry,
      context,
      showEditEntryButton,
    );
  }

  Widget _entryRawContent(double screenWidth, Entry entry, BuildContext context, bool showEditEntryButton) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            //width: screenWidth * .80,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (entry.bannerImageUrl.isNotEmpty)
                    FutureBuilder(
                      future: _buildFirestorageFromImageName(entry.id, entry.bannerImageUrl),
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
                            border: Border.all(
                              color: AppTheme.lightTheme.colorScheme.secondary,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              entry.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.lightTheme.colorScheme.secondary,
                              ),
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
                            border: Border.all(color: AppTheme.lightTheme.colorScheme.secondary),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              entry.subtitle,
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: AppTheme.lightTheme.colorScheme.secondary,
                              ),
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
                          child:
                              // Html(
                              //   data: entry.content,
                              //   extensions: const [
                              //     IframeHtmlExtension(),
                              //   ],
                              //   style: {
                              //     "body": Style(
                              //       backgroundColor: Colors.white,
                              //       color: Colors.black,
                              //       fontFamily: 'Roboto',
                              //     ),
                              //   },
                              // ),
                              HtmlWidget(
                            entry.content,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (entry.comments.isNotEmpty) const Divider(),
                  if (entry.comments.isNotEmpty)
                    const Row(
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  if (entry.comments.isNotEmpty) const SizedBox(height: 4),
                  if (entry.comments.isNotEmpty)
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
                                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                                      child: ListTile(
                                        title: Text(
                                          localizations.comment_title(comment.authorName, comment.createdAt),
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        subtitle: Text(
                                          comment.content,
                                          style: const TextStyle(color: Colors.black),
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
                  if (showEditEntryButton)
                    ElevatedButton(
                      onPressed: () async {
                        await context.pushNamed(RoutNames.blogEditEntry, extra: entry);
                      },
                      child: const Text('Editar entrada'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Future<String?> _buildFirestorageFromImageName(String entryId, String imageName) async {
    try {
      // Referencia al archivo en Firebase Storage
      final ref = FirebaseStorage.instance.ref().child('blog/$entryId/$imageName');

      // Obtener la URL de descarga
      var url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      developer.log('Error obteniendo la URL de la imagen($entryId/$imageName): $e');
    }
    return null;
  }
}
