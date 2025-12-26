import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/portfolio_importer.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class PortfolioImportPage extends ConsumerStatefulWidget {
  const PortfolioImportPage({super.key});

  @override
  ConsumerState<PortfolioImportPage> createState() => _PortfolioImportPageState();
}

class _PortfolioImportPageState extends ConsumerState<PortfolioImportPage> {
  bool _isLoading = false;
  String? _message;
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: Scaffold(
        backgroundColor: AppTheme.lightTheme.colorScheme.secondary,
        appBar: AppBar(
          title: const Text('Portfolio Import'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_upload, size: 64),
              const SizedBox(height: 24),
              const Text(
                'Importar Portfolios Predefinidos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Esta acción importará 3 proyectos predefinidos a Firestore:\n'
                '• My Website\n'
                '• Svg Style Cleaner\n'
                '• ApiOpenBuilder',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (_message != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _isSuccess ? Colors.green.withAlpha(128) : Colors.red.withAlpha(128),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _message!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _isSuccess ? Colors.green[900] : Colors.red[900],
                    ),
                  ),
                ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isLoading ? null : () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _importPortfolios,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('Importar'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ExpansionTile(
                title: const Text('Acciones Avanzadas'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Elimina todos los portfolios actuales antes de importar los predefinidos.',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _isLoading ? null : _clearAndImport,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Limpiar y Reimportar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _importPortfolios() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      await PortfolioImporter.importDefaultPortfolios();
      setState(() {
        _isSuccess = true;
        _message = '✅ Importación completada con éxito';
      });

      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        _isSuccess = false;
        _message = '❌ Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _clearAndImport() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar'),
        content: const Text(
          'Esta acción eliminará TODOS los portfolios actuales y los reemplazará con los predefinidos. ¿Deseas continuar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Eliminar y Reimportar'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      await PortfolioImporter.clearAllPortfolios();
      await PortfolioImporter.importDefaultPortfolios();
      setState(() {
        _isSuccess = true;
        _message = '✅ Limpieza e importación completadas con éxito';
      });

      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        _isSuccess = false;
        _message = '❌ Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
