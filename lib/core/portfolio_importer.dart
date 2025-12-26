import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:javier_website/model/portfolio_entry.dart';

class PortfolioImporter {
  static final _firestore = FirebaseFirestore.instance;

  /// Importa los portfolios predefinidos a Firestore
  /// Solo ejecutar una vez para migrar datos existentes
  static Future<void> importDefaultPortfolios() async {
    try {
      final defaultPortfolios = _getDefaultPortfolios();

      for (var portfolio in defaultPortfolios) {
        await _firestore.collection('portfolio').doc(portfolio.id).set(portfolio.toJson());
      }

      print('✅ Importación completada: ${defaultPortfolios.length} items importados');
    } catch (e) {
      print('❌ Error durante la importación: $e');
      rethrow;
    }
  }

  /// Obtiene la lista de portfolios predefinidos
  static List<PortfolioEntry> _getDefaultPortfolios() {
    return [
      PortfolioEntry(
        id: 'my_website',
        name: 'My Website',
        description: 'Sample website and mobile app made with Flutter',
        url: 'https://github.com/jpdata/javier_website',
        icon: 'assets/images/github.svg',
        iconIsAsset: true,
        imageUrl: '',
        createdAt: DateTime(2023, 1, 1),
      ),
      PortfolioEntry(
        id: 'svg_style_cleaner',
        name: 'Svg Style Cleaner',
        description: 'Clean up SVG files by removing unnecessary styles',
        url: 'https://github.com/jpdata/SvgStyleCleaner',
        icon: 'assets/images/github.svg',
        iconIsAsset: true,
        imageUrl: '',
        createdAt: DateTime(2023, 1, 15),
      ),
      PortfolioEntry(
        id: 'api_open_builder',
        name: 'ApiOpenBuilder',
        description: 'Generate Dart API client code from OpenAPI 3.0 spec',
        url: 'https://github.com/jpdata/api_open_builder',
        icon: 'assets/images/github.svg',
        iconIsAsset: true,
        imageUrl: '',
        createdAt: DateTime(2023, 2, 1),
      ),
    ];
  }

  /// Elimina todos los portfolios de Firestore (para limpiar antes de reimportar)
  static Future<void> clearAllPortfolios() async {
    try {
      final snapshot = await _firestore.collection('portfolio').get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
      print('✅ Todos los portfolios fueron eliminados');
    } catch (e) {
      print('❌ Error al eliminar portfolios: $e');
      rethrow;
    }
  }
}
