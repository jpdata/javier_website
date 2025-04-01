import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/view/home/widgets/resumed_entries_from_firebase_widget.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class BlogEntriesListPage extends ConsumerWidget {
  const BlogEntriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * .80,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ResumedEntriesFromFirebaseWidget(),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para crear una nueva entrada
                      },
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor:
                      //       Theme.of(context).colorScheme.onPrimary,
                      //   foregroundColor: Theme.of(context).colorScheme.primary,
                      // ),
                      child: const Text('Nueva entrada'),
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
}
