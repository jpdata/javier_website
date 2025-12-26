import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/assets.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';

/// Type alias for localized entry data
typedef LocalizedEntry = Map<String, String>;

/// Provider for portfolio projects list
final projectsProvider = Provider<List<LocalizedEntry>>((ref) {
  // Watch the locale to trigger rebuild when language changes
  ref.watch(localeProvider);
  
  return [
    {
      'icon': Assets.githubIcon,
      'name': localizations.my_website,
      'url': 'https://github.com/jpdata/javier_website',
      'description': localizations.my_website_description,
    },
    {
      'icon': Assets.githubIcon,
      'name': localizations.svg_style_cleaner,
      'url': 'https://github.com/jpdata/SvgStyleCleaner',
      'description': localizations.svg_style_cleaner_description,
    },
    {
      'icon': Assets.githubIcon,
      'name': localizations.api_open_builder,
      'url': 'https://github.com/jpdata/api_open_builder',
      'description': localizations.api_open_builder_description,
    },
  ];
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
