import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/portfolio_entry.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:javier_website/viewmodel/portfolio/portfolio_view_model.dart';

class PortfolioFormPage extends ConsumerStatefulWidget {
  final PortfolioEntry? entry;

  const PortfolioFormPage({super.key, this.entry});

  @override
  ConsumerState<PortfolioFormPage> createState() => _PortfolioFormPageState();
}

class _PortfolioFormPageState extends ConsumerState<PortfolioFormPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _urlController;
  late TextEditingController _iconController;
  late TextEditingController _imageUrlController;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late bool _iconIsAsset;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController = TextEditingController(text: widget.entry?.name ?? '');
    _descriptionController = TextEditingController(text: widget.entry?.description ?? '');
    _urlController = TextEditingController(text: widget.entry?.url ?? '');
    _iconController = TextEditingController(text: widget.entry?.icon ?? '');
    _imageUrlController = TextEditingController(text: widget.entry?.imageUrl ?? '');
    _iconIsAsset = widget.entry?.iconIsAsset ?? false;
  }

  @override
  void didUpdateWidget(PortfolioFormPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.entry?.id != widget.entry?.id) {
      _nameController.dispose();
      _descriptionController.dispose();
      _urlController.dispose();
      _iconController.dispose();
      _imageUrlController.dispose();
      _initializeControllers();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _urlController.dispose();
    _iconController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showBackButton: true,
      showDrawer: false,
      title: widget.entry == null ? localizations.add_new_portfolio : localizations.edit_portfolio,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: localizations.name,
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return localizations.name_required;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: localizations.description,
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return localizations.description_required;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    labelText: localizations.url,
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return localizations.url_required;
                    }
                    final uri = Uri.tryParse(value!);
                    if (uri == null || !uri.isAbsolute) {
                      return localizations.invalid_url;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(localizations.icon_type),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SegmentedButton<bool>(
                        segments: <ButtonSegment<bool>>[
                          ButtonSegment<bool>(
                            value: false,
                            label: Text(localizations.icon_is_url),
                          ),
                          ButtonSegment<bool>(
                            value: true,
                            label: Text(localizations.icon_is_asset),
                          ),
                        ],
                        selected: <bool>{_iconIsAsset},
                        onSelectionChanged: (Set<bool> newSelection) {
                          setState(() {
                            _iconIsAsset = newSelection.first;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _iconController,
                  decoration: InputDecoration(
                    labelText: localizations.icon_url,
                    border: const OutlineInputBorder(),
                    helperText: _iconIsAsset 
                      ? 'e.g., assets/images/icon.svg' 
                      : localizations.icon_url_helper,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    labelText: localizations.image_url,
                    border: const OutlineInputBorder(),
                    helperText: localizations.image_url_helper,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _isLoading ? null : () => Navigator.pop(context),
                      child: Text(localizations.cancel),
                    ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _savePortfolioEntry,
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(localizations.save),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _savePortfolioEntry() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final entry = PortfolioEntry(
        id: widget.entry?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        description: _descriptionController.text,
        url: _urlController.text,
        icon: _iconController.text,
        iconIsAsset: _iconIsAsset,
        imageUrl: _imageUrlController.text,
        createdAt: widget.entry?.createdAt ?? DateTime.now(),
      );

      if (widget.entry == null) {
        await ref.read(portfolioViewModelProvider.notifier).addEntry(entry);
      } else {
        await ref.read(portfolioViewModelProvider.notifier).updateEntry(entry);
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(localizations.saved_successfully)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${localizations.error}: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
