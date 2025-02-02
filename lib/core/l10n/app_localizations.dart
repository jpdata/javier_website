import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ca.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ca'),
    Locale('en'),
    Locale('es'),
    Locale('es', 'VE')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Javi\'\'s Personal Website'**
  String get title;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @contact_me.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contact_me;

  /// No description provided for @contact_me_body.
  ///
  /// In en, this message translates to:
  /// **'If you want to contact me, just email me back at jpdata@gmail.com'**
  String get contact_me_body;

  /// No description provided for @contact_me_by_email.
  ///
  /// In en, this message translates to:
  /// **'Contact me by Email'**
  String get contact_me_by_email;

  /// No description provided for @about_me.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get about_me;

  /// No description provided for @more_options.
  ///
  /// In en, this message translates to:
  /// **'More Options'**
  String get more_options;

  /// No description provided for @drawer_header.
  ///
  /// In en, this message translates to:
  /// **'How to reach Javi ...'**
  String get drawer_header;

  /// No description provided for @cogito_ergo_sum.
  ///
  /// In en, this message translates to:
  /// **'I program, therefore I am'**
  String get cogito_ergo_sum;

  /// No description provided for @doing_cool_stuf_with_porgramming_languages.
  ///
  /// In en, this message translates to:
  /// **'Doing cool stuff with programming languages'**
  String get doing_cool_stuf_with_porgramming_languages;

  /// No description provided for @spanish_spain.
  ///
  /// In en, this message translates to:
  /// **'Spanish (Spain)'**
  String get spanish_spain;

  /// No description provided for @spanish_venezuela.
  ///
  /// In en, this message translates to:
  /// **'Spanish (Venezuela)'**
  String get spanish_venezuela;

  /// No description provided for @catalan.
  ///
  /// In en, this message translates to:
  /// **'Catalan'**
  String get catalan;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @my_website.
  ///
  /// In en, this message translates to:
  /// **'My Website'**
  String get my_website;

  /// No description provided for @my_website_description.
  ///
  /// In en, this message translates to:
  /// **'sample website and mobile app made with Flutter'**
  String get my_website_description;

  /// No description provided for @svg_style_cleaner.
  ///
  /// In en, this message translates to:
  /// **'Svg Style Cleaner'**
  String get svg_style_cleaner;

  /// No description provided for @svg_style_cleaner_description.
  ///
  /// In en, this message translates to:
  /// **'Clean up SVG files by removing unnecessary styles'**
  String get svg_style_cleaner_description;

  /// No description provided for @api_open_builder.
  ///
  /// In en, this message translates to:
  /// **'ApiOpenBuilder'**
  String get api_open_builder;

  /// No description provided for @api_open_builder_description.
  ///
  /// In en, this message translates to:
  /// **'Generate Dart API client code from OpenAPI 3.0 spec'**
  String get api_open_builder_description;

  /// No description provided for @some_of_my_projects.
  ///
  /// In en, this message translates to:
  /// **'Some of my projects'**
  String get some_of_my_projects;

  /// No description provided for @credits_i_must_give.
  ///
  /// In en, this message translates to:
  /// **'Credits I must give'**
  String get credits_i_must_give;

  /// No description provided for @my_collaborations.
  ///
  /// In en, this message translates to:
  /// **'Collaborations'**
  String get my_collaborations;

  /// No description provided for @collaborators.
  ///
  /// In en, this message translates to:
  /// **'Collaborators'**
  String get collaborators;

  /// No description provided for @design_colors_and_images.
  ///
  /// In en, this message translates to:
  /// **'Design, colors and images'**
  String get design_colors_and_images;

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @comment_title.
  ///
  /// In en, this message translates to:
  /// **'{name} commented on {date}'**
  String comment_title(String name, DateTime date);

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @newEntry.
  ///
  /// In en, this message translates to:
  /// **'New Entry'**
  String get newEntry;

  /// No description provided for @subtitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitle'**
  String get subtitle;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @bannerImageUrl.
  ///
  /// In en, this message translates to:
  /// **'Banner Image URL'**
  String get bannerImageUrl;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags (comma separated)'**
  String get tags;

  /// No description provided for @saveEntry.
  ///
  /// In en, this message translates to:
  /// **'Save Entry'**
  String get saveEntry;

  /// No description provided for @pleaseEnterTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get pleaseEnterTitle;

  /// No description provided for @pleaseEnterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a subtitle'**
  String get pleaseEnterSubtitle;

  /// No description provided for @pleaseEnterContent.
  ///
  /// In en, this message translates to:
  /// **'Please enter content'**
  String get pleaseEnterContent;

  /// No description provided for @pleaseEnterBannerImageUrl.
  ///
  /// In en, this message translates to:
  /// **'Please enter a banner image URL'**
  String get pleaseEnterBannerImageUrl;

  /// No description provided for @blog.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get blog;

  /// No description provided for @blog_entry.
  ///
  /// In en, this message translates to:
  /// **'Blog Entry'**
  String get blog_entry;

  /// No description provided for @blog_entries.
  ///
  /// In en, this message translates to:
  /// **'Blog Entries'**
  String get blog_entries;

  /// No description provided for @blog_new_entry.
  ///
  /// In en, this message translates to:
  /// **'New Blog Entry'**
  String get blog_new_entry;

  /// No description provided for @read_more.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get read_more;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ca', 'en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es': {
  switch (locale.countryCode) {
    case 'VE': return AppLocalizationsEsVe();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca': return AppLocalizationsCa();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
