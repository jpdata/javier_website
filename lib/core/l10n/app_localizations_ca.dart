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
  String get contact_me_body =>
      'Si vols contactar amb mi, només envia\'m un correu a jpdata@gmail.com';

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
  String get doing_cool_stuf_with_porgramming_languages =>
      'Fent coses genials amb llenguatges de programació';

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
  String get my_website_description =>
      'Exemple de lloc web i aplicació mòbil feta amb Flutter';

  @override
  String get svg_style_cleaner => 'Netejador d\'estils SVG';

  @override
  String get svg_style_cleaner_description =>
      'Neteja fitxers SVG eliminant estils innecessaris';

  @override
  String get api_open_builder => 'ApiOpenBuilder';

  @override
  String get api_open_builder_description =>
      'Genera codi client API de Dart a partir de l\'especificació OpenAPI 3.0';

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
  String get pleaseEnterBannerImageUrl =>
      'Si us plau, introdueix una URL de la imatge de banner';

  @override
  String get read_more => 'Llegir més';

  @override
  String get blog => 'Blog';

  @override
  String get blog_entry => 'Entrada de Blog';

  @override
  String get blog_entries => 'Entrades de Blog';

  @override
  String get blog_new_entry => 'Nova Entrada de Blog';

  @override
  String get blog_edit_entry => 'Edita Entrada';

  @override
  String get news => 'Notícies';

  @override
  String get news_entry => 'Entrada de Notícies';

  @override
  String get news_entries => 'Entrades de Notícies';

  @override
  String get news_new_entry => 'Nova Entrada';

  @override
  String get news_edit_entry => 'Edita Entrada';

  @override
  String get pickAnImage => 'Selecciona una imatge';

  @override
  String get signIn => 'Inicia Sessió';

  @override
  String get signOut => 'Tanca Sessió';

  @override
  String get signingIn => 'Iniciant Sessió';

  @override
  String get error => 'Error';

  @override
  String get signingOut => 'Tancant Sessió';

  @override
  String get loadind_data => 'Carregant dades...';

  @override
  String get email => 'Correu electrònic';

  @override
  String get password => 'Contrasenya';

  @override
  String get cancel => 'Cancel·la';

  @override
  String get ok => 'D\'acord';

  @override
  String get delete => 'Esborra';

  @override
  String get delete_entry => 'Esborra Entrada';

  @override
  String get delete_comment => 'Esborra Comentari';

  @override
  String get back => 'Enrere';

  @override
  String get return_ => 'Torna';

  @override
  String news_on(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Notícies del $dateString';
  }

  @override
  String get hiberus => 'hiberus';

  @override
  String get instagram => 'Instagram';

  @override
  String get linkedin => 'LinkedIn';

  @override
  String get github => 'GitHub';

  @override
  String get unknown_error => 'Ha ocorregut un error desconegut';

  @override
  String get network_error =>
      'Error de connexió. Si us plau, comprova la teva connexió a internet.';

  @override
  String get permission_error => 'No tens permís per accedir a aquest recurs';

  @override
  String get timeout_error =>
      'La solicitud ha excedit el temps límit. Si us plau, intenta de nou.';

  @override
  String get not_found_error => 'El recurs sol·licitat no va ser trobat';

  @override
  String get authentication_error =>
      'Error d\'autenticació. Si us plau, inicia sessió de nou.';

  @override
  String get something_went_wrong =>
      'Quelcom va anar malament. Si us plau, intenta més tard.';

  @override
  String get manage_portfolio => 'Gestionar Portafoli';

  @override
  String get add_new_portfolio => 'Afegir Nou Portafoli';

  @override
  String get edit_portfolio => 'Edita Portafoli';

  @override
  String get portfolio_management => 'Gestió del Portafoli';

  @override
  String get add_new => 'Afegir Nou';

  @override
  String get no_portfolio_items => 'Encara no hi ha elements al portafoli';

  @override
  String get name => 'Nom';

  @override
  String get name_required => 'El nom és obligatori';

  @override
  String get description => 'Descripció';

  @override
  String get description_required => 'La descripció és obligatòria';

  @override
  String get url => 'URL';

  @override
  String get url_required => 'L\'URL és obligatòria';

  @override
  String get invalid_url => 'URL no vàlida';

  @override
  String get icon_url => 'URL de la Icona';

  @override
  String get icon_url_helper => 'URL de la imatge de la icona (opcional)';

  @override
  String get icon_type => 'Tipus de Icona';

  @override
  String get icon_is_asset => 'Icona és Asset';

  @override
  String get icon_is_url => 'Icona és URL';

  @override
  String get image_url => 'URL de la Imatge';

  @override
  String get image_url_helper => 'URL de la imatge del projecte (opcional)';

  @override
  String get save => 'Guardar';

  @override
  String get saved_successfully => 'Desat exitosament';

  @override
  String get confirm_delete => 'Confirma Eliminació';

  @override
  String get are_you_sure_delete => 'Estàs segur que vols esborrar';

  @override
  String get edit => 'Edita';
}
