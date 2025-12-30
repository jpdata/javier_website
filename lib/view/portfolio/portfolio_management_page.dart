import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/error_handler.dart';
import 'package:javier_website/model/portfolio_entry.dart';
import 'package:javier_website/view/portfolio/portfolio_form_page.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:javier_website/viewmodel/portfolio/portfolio_view_model.dart';

class PortfolioManagementPage extends ConsumerWidget {
  const PortfolioManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioViewModelProvider);

    return CommonScaffold(
      child: portfolioAsync.when(
        data: (entries) => _buildPortfolioList(context, ref, entries),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => ErrorHandler.errorWidget(error),
      ),
    );
  }

  Widget _buildPortfolioList(BuildContext context, WidgetRef ref, List<PortfolioEntry> entries) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.manage_portfolio,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: entries.isEmpty
              ? Center(
                  child: Text(localizations.no_portfolio_items),
                )
              : ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return ListTile(
                      title: Text(entry.name),
                      subtitle: Text(entry.description),
                      trailing: PopupMenuButton(
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: Text(localizations.edit),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PortfolioFormPage(entry: entry),
                                ),
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: Text(localizations.delete),
                            onTap: () {
                              _showDeleteConfirmation(context, ref, entry);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PortfolioFormPage(entry: entry),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
              Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 32, 16),
          child: Column(
            children: [
              Row(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PortfolioFormPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: Text(localizations.add_new),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, PortfolioEntry entry) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.confirm_delete),
        content: Text('${localizations.are_you_sure_delete} "${entry.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () {
              ref.read(portfolioViewModelProvider.notifier).deleteEntry(entry.id);
              Navigator.pop(context);
            },
            child: Text(localizations.delete),
          ),
        ],
      ),
    );
  }
}
