import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/assets.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/viewmodel/portfolio/portfolio_view_model.dart';

/// Type alias for localized entry data
typedef LocalizedEntry = Map<String, dynamic>;

/// Provider for portfolio projects list - now fetches from Firebase
final projectsProvider = FutureProvider<List<LocalizedEntry>>((ref) async {
  // Watch the locale to trigger rebuild when language changes
  ref.watch(localeProvider);
  
  // Fetch portfolio entries from Firebase
  final portfolioEntries = await ref.watch(portfolioViewModelProvider.future);
  
  // Convert to LocalizedEntry format compatible with UI
  return portfolioEntries.map((entry) {
    return {
      'icon': entry.icon.isNotEmpty ? entry.icon : Assets.githubIcon,
      'iconIsAsset': entry.iconIsAsset,
      'name': entry.name,
      'url': entry.url,
      'description': entry.description,
    };
  }).toList();
});

/// Provider for collaborators list
final collaboratorsProvider = Provider<List<LocalizedEntry>>((ref) {
  ref.watch(localeProvider);
  
  return [
    {
      'icon': Assets.linkedin,
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
    },
  ];
});

/// Provider for collaborations list
final collaborationsProvider = Provider<List<LocalizedEntry>>((ref) {
  ref.watch(localeProvider);
  
  return [
    {
      'icon': Assets.linkedin,
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
    },
  ];
});

/// Provider for credits list
final creditsProvider = Provider<List<LocalizedEntry>>((ref) {
  ref.watch(localeProvider);
  
  // All credits are commented out for now
  // Add items here to display credits
  return [];
});
