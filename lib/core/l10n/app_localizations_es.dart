import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Sitio web personal de Javi';

  @override
  String get home => 'Inicio';

  @override
  String get contact_me => 'Contáctame';

  @override
  String get contact_me_body => 'Si quieres contactarme, simplemente envíame un correo electrónico a jpdata@gmail.com';

  @override
  String get contact_me_by_email => 'Contáctame por correo electrónico';

  @override
  String get about_me => 'Sobre mí';

  @override
  String get more_options => 'Más opciones';

  @override
  String get drawer_header => 'Como contactarme ...';

  @override
  String get cogito_ergo_sum => 'Programo, luego existo';

  @override
  String get doing_cool_stuf_with_porgramming_languages => 'Haciendo cosas chulas con lenguajes de programación';

  @override
  String get spanish_spain => 'Español (España)';

  @override
  String get spanish_venezuela => 'Español (Venezuela)';

  @override
  String get catalan => 'Catalán';

  @override
  String get english => 'Inglés';
}

/// The translations for Spanish Castilian, as used in Venezuela (`es_VE`).
class AppLocalizationsEsVe extends AppLocalizationsEs {
  AppLocalizationsEsVe(): super('es_VE');

  @override
  String get title => 'Website personal de Javi';

  @override
  String get home => 'Inicio';

  @override
  String get contact_me => 'Contáctame';

  @override
  String get contact_me_body => 'Si quieres contactarme, simplemente envíame un email a jpdata@gmail.com';

  @override
  String get contact_me_by_email => 'Contáctame por email';

  @override
  String get about_me => 'Acerca de mí';

  @override
  String get more_options => 'Más opciones';

  @override
  String get drawer_header => 'Como contactarme ...';

  @override
  String get cogito_ergo_sum => 'Programo, luego existo';

  @override
  String get doing_cool_stuf_with_porgramming_languages => 'Haciendo cosas finas con lenguajes de programación';

  @override
  String get spanish_spain => 'Español (España)';

  @override
  String get spanish_venezuela => 'Español (Venezuela)';

  @override
  String get catalan => 'Catalán';

  @override
  String get english => 'Inglés';
}
