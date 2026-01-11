import 'dart:developer' as developer;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:glassmorphism/glassmorphism.dart';

class EntryDetailWidget extends StatelessWidget {
  final Entry entry;
  final bool showEditEntryButton;

  const EntryDetailWidget({super.key, required this.entry, this.showEditEntryButton = false});

  @override
  Widget build(BuildContext context) {
    return _entryRawContent(entry, context, showEditEntryButton);
  }

  Widget _entryRawContent(Entry entry, BuildContext context, bool showEditEntryButton) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: Colors.black.withAlpha(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 8),
            if (entry.bannerImageUrl.isNotEmpty)
              FutureBuilder(
                future: _buildFirestorageFromImageName(entry.id, entry.bannerImageUrl),
                builder: (context, snapshot) => snapshot.hasData
                    ? Image.network(snapshot.data.toString(), height: screenHeight * 0.15, width: screenWidth)
                    : const CircularProgressIndicator(),
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
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
                IconButton(
                  tooltip: 'Copiar enlace',
                  onPressed: () async {
                    final origin = Uri.base.origin; // preserves scheme + host (+ port in local dev)
                    final shareUrl = '$origin/blog/${entry.id}';
                    await Clipboard.setData(ClipboardData(text: shareUrl));
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enlace copiado')), // brief feedback
                      );
                    }
                  },
                  icon: const Icon(Icons.link),
                  color: AppTheme.lightTheme.colorScheme.secondary,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
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
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                    child: HtmlWidget(
                      entry.content,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        backgroundColor: Colors.white.withAlpha(0),
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
                children: [Text('Comments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))],
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
                              child: GlassmorphicContainer(
                                width: double.infinity,
                                height: 80, // Set an appropriate height for the comment container
                                borderRadius: 12,
                                blur: 16,
                                alignment: Alignment.center,
                                border: 1,
                                linearGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withAlpha((0.2 * 255).toInt()),
                                    Colors.white.withAlpha((0.05 * 255).toInt()),
                                  ],
                                  stops: const [0.1, 1],
                                ),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withAlpha((0.5 * 255).toInt()),
                                    Colors.white.withAlpha((0.05 * 255).toInt()),
                                  ],
                                ),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                                  child: ListTile(
                                    title: Text(
                                      localizations.comment_title(comment.authorName, comment.createdAt),
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                    subtitle: Text(comment.content, style: const TextStyle(color: Colors.black)),
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
            if (showEditEntryButton) ...[
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  await context.pushNamed(RoutNames.blogEditEntry, extra: entry);
                },
                child: const Text('Editar entrada'),
              ),
            ],
          ],
        ),
      ),
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
