// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get title => 'La Pàgina Personal d\'en Javi';

  @override
  String get home => 'Inici';

  @override
  String get contact_me => 'Contacta\'m';

  @override
  String get contact_me_body => 'Si vols contactar amb mi, només envia\'m un correu a jpdata@gmail.com';

  @override
  String get contact_me_by_email => 'Contacta\'m per Correu Electrònic';

  @override
  String get about_me => 'Sobre mi';

  @override
  String get more_options => 'Més Opcions';

  @override
  String get drawer_header => 'Com contactar amb en Javi ...';

  @override
  String get cogito_ergo_sum => 'Programo, per tant existeixo';

  @override
  String get doing_cool_stuf_with_porgramming_languages => 'Fent coses genials amb llenguatges de programació';

  @override
  String get spanish_spain => 'Espanyol (Espanya)';

  @override
  String get spanish_venezuela => 'Espanyol (Veneçuela)';

  @override
  String get catalan => 'Català';

  @override
  String get english => 'Anglès';

  @override
  String get my_website => 'El meu lloc web';

  @override
  String get my_website_description => 'Exemple de lloc web i aplicació mòbil feta amb Flutter';

  @override
  String get svg_style_cleaner => 'Netejador d\'estils SVG';

  @override
  String get svg_style_cleaner_description => 'Neteja fitxers SVG eliminant estils innecessaris';

  @override
  String get api_open_builder => 'ApiOpenBuilder';

  @override
  String get api_open_builder_description => 'Genera codi client API de Dart a partir de l\'especificació OpenAPI 3.0';

  @override
  String get some_of_my_projects => 'Alguns dels meus projectes';

  @override
  String get credits_i_must_give => 'Crèdits que he de donar';

  @override
  String get my_collaborations => 'Col·laboracions';

  @override
  String get collaborators => 'Col·laboradors';

  @override
  String get design_colors_and_images => 'Disseny, colors i imatges';

  @override
  String get portfolio => 'Portafoli';

  @override
  String comment_title(String name, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$name ha comentat el $dateString';
  }

  @override
  String get comments => 'Comentaris';

  @override
  String get newEntry => 'Nova Entrada';

  @override
  String get subtitle => 'Subtítol';

  @override
  String get entryTitle => 'Títol';

  @override
  String get content => 'Contingut';

  @override
  String get bannerImageUrl => 'URL de la Imatge de Banner';

  @override
  String get tags => 'Etiquetes (separades per comes)';

  @override
  String get saveEntry => 'Guardar Entrada';

  @override
  String get pleaseEnterTitle => 'Si us plau, introdueix un títol';

  @override
  String get pleaseEnterSubtitle => 'Si us plau, introdueix un subtítol';

  @override
  String get pleaseEnterContent => 'Si us plau, introdueix contingut';

  @override
  String get pleaseEnterBannerImageUrl => 'Si us plau, introdueix una URL de la imatge de banner';

  @override
  String get blog => 'Blog';

  @override
  String get blog_entry => 'Entrada de Blog';

  @override
  String get blog_entries => 'Entrades de Blog';

  @override
  String get blog_new_entry => 'Nova Entrada de Blog';

  @override
  String get read_more => 'Llegir més';
}
