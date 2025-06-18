// ignore: unused_import
import 'package:intl/intl.dart' as intl;
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
  String get contact_me_body =>
      'Si quieres contactarme, simplemente envíame un correo electrónico a jpdata@gmail.com';

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
  String get doing_cool_stuf_with_porgramming_languages =>
      'Haciendo cosas chulas con lenguajes de programación';

  @override
  String get spanish_spain => 'Español (España)';

  @override
  String get spanish_venezuela => 'Español (Venezuela)';

  @override
  String get catalan => 'Catalán';

  @override
  String get english => 'Inglés';

  @override
  String get my_website => 'Mi sitio web';

  @override
  String get my_website_description =>
      'Ejemplo de sitio web y aplicación móvil hecha con Flutter';

  @override
  String get svg_style_cleaner => 'Limpiador de estilos SVG';

  @override
  String get svg_style_cleaner_description =>
      'Limpia archivos SVG eliminando estilos innecesarios';

  @override
  String get api_open_builder => 'ApiOpenBuilder';

  @override
  String get api_open_builder_description =>
      'Genera código cliente API de Dart a partir de la especificación OpenAPI 3.0';

  @override
  String get some_of_my_projects => 'Algunos de mis proyectos';

  @override
  String get credits_i_must_give => 'Créditos que debo dar';

  @override
  String get my_collaborations => 'Colaboraciones';

  @override
  String get collaborators => 'Colaboradores';

  @override
  String get design_colors_and_images => 'Diseño, colores e imágenes';

  @override
  String get portfolio => 'Portafolio';

  @override
  String comment_title(String name, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$name ha comentado el $dateString';
  }

  @override
  String get comments => 'Comentarios';

  @override
  String get newEntry => 'Nueva Entrada';

  @override
  String get subtitle => 'Subtítulo';

  @override
  String get entryTitle => 'Título';

  @override
  String get content => 'Contenido';

  @override
  String get bannerImageUrl => 'URL de la Imagen de Banner';

  @override
  String get tags => 'Etiquetas (separadas por comas)';

  @override
  String get saveEntry => 'Guardar Entrada';

  @override
  String get pleaseEnterTitle => 'Por favor ingrese un título';

  @override
  String get pleaseEnterSubtitle => 'Por favor ingrese un subtítulo';

  @override
  String get pleaseEnterContent => 'Por favor ingrese contenido';

  @override
  String get pleaseEnterBannerImageUrl =>
      'Por favor ingrese una URL de imagen de banner';

  @override
  String get read_more => 'Leer más';

  @override
  String get blog => 'Blog';

  @override
  String get blog_entry => 'Entrada de Blog';

  @override
  String get blog_entries => 'Entradas de Blog';

  @override
  String get blog_new_entry => 'Nueva Entrada de Blog';

  @override
  String get blog_edit_entry => 'Editar Entrada';

  @override
  String get news => 'Noticias';

  @override
  String get news_entry => 'Entrada de Noticias';

  @override
  String get news_entries => 'Entradas de Noticias';

  @override
  String get news_new_entry => 'Nueva Entrada';

  @override
  String get news_edit_entry => 'Editar Entrada';

  @override
  String get pickAnImage => 'Selecciona una imagen';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get signOut => 'Cerrar Sesión';

  @override
  String get signingIn => 'Iniciando Sesión';

  @override
  String get error => 'Error';

  @override
  String get signingOut => 'Cerrando Sesión';

  @override
  String get loadind_data => 'Cargando datos...';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get delete => 'Eliminar';

  @override
  String get delete_entry => 'Eliminar Entrada';

  @override
  String get delete_comment => 'Eliminar Comentario';

  @override
  String get back => 'Atrás';

  @override
  String get return_ => 'Regresar';

  @override
  String news_on(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Noticias del $dateString';
  }

  @override
  String get hiberus => 'hiberus';

  @override
  String get instagram => 'Instagram';

  @override
  String get linkedin => 'LinkedIn';

  @override
  String get github => 'GitHub';
}

/// The translations for Spanish Castilian, as used in Venezuela (`es_VE`).
class AppLocalizationsEsVe extends AppLocalizationsEs {
  AppLocalizationsEsVe() : super('es_VE');

  @override
  String get title => 'Website personal de Javi';

  @override
  String get home => 'Inicio';

  @override
  String get contact_me => 'Contáctame';

  @override
  String get contact_me_body =>
      'Si quieres contactarme, simplemente envíame un email a jpdata@gmail.com';

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
  String get doing_cool_stuf_with_porgramming_languages =>
      'Haciendo cosas finas con lenguajes de programación';

  @override
  String get spanish_spain => 'Español (España)';

  @override
  String get spanish_venezuela => 'Español (Venezuela)';

  @override
  String get catalan => 'Catalán';

  @override
  String get english => 'Inglés';

  @override
  String get my_website => 'Mi website';

  @override
  String get my_website_description =>
      'Ejemplo de website y aplicación móvil hecha con Flutter';

  @override
  String get svg_style_cleaner => 'Limpiador de estilos SVG';

  @override
  String get svg_style_cleaner_description =>
      'Limpia archivos SVG eliminando estilos innecesarios';

  @override
  String get api_open_builder => 'ApiOpenBuilder';

  @override
  String get api_open_builder_description =>
      'Genera código cliente API de Dart a partir de la especificación OpenAPI 3.0';

  @override
  String get some_of_my_projects => 'Algunos de mis proyectos';

  @override
  String get credits_i_must_give => 'Créditos que debo dar';

  @override
  String get my_collaborations => 'Colaboraciones';

  @override
  String get collaborators => 'Colaboradores';

  @override
  String get design_colors_and_images => 'Diseño, colores e imágenes';

  @override
  String get portfolio => 'Portafolio';

  @override
  String comment_title(String name, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$name comentó el $dateString';
  }

  @override
  String get comments => 'Comentarios';

  @override
  String get newEntry => 'Nueva Entrada';

  @override
  String get subtitle => 'Subtítulo';

  @override
  String get entryTitle => 'Título';

  @override
  String get content => 'Contenido';

  @override
  String get bannerImageUrl => 'URL de la Imagen de Banner';

  @override
  String get tags => 'Etiquetas (separadas por comas)';

  @override
  String get saveEntry => 'Guardar Entrada';

  @override
  String get pleaseEnterTitle => 'Por favor ingrese un título';

  @override
  String get pleaseEnterSubtitle => 'Por favor ingrese un subtítulo';

  @override
  String get pleaseEnterContent => 'Por favor ingrese contenido';

  @override
  String get pleaseEnterBannerImageUrl =>
      'Por favor ingrese una URL de imagen de banner';

  @override
  String get read_more => 'Leer más';

  @override
  String get blog => 'Blog';

  @override
  String get blog_entry => 'Entrada de Blog';

  @override
  String get blog_entries => 'Entradas de Blog';

  @override
  String get blog_new_entry => 'Nueva Entrada de Blog';

  @override
  String get blog_edit_entry => 'Editar Entrada';

  @override
  String get news => 'Noticias';

  @override
  String get news_entry => 'Entrada de Noticias';

  @override
  String get news_entries => 'Entradas de Noticias';

  @override
  String get news_new_entry => 'Nueva Entrada';

  @override
  String get news_edit_entry => 'Editar Entrada';

  @override
  String get pickAnImage => 'Selecciona una imagen';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get signOut => 'Cerrar Sesión';

  @override
  String get signingIn => 'Iniciando Sesión';

  @override
  String get error => 'Error';

  @override
  String get signingOut => 'Cerrando Sesión';

  @override
  String get loadind_data => 'Cargando datos...';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get delete => 'Borrar';

  @override
  String get delete_entry => 'Borrar Entrada';

  @override
  String get delete_comment => 'Borrar Comentario';

  @override
  String get back => 'Atrás';

  @override
  String get return_ => 'Volver';

  @override
  String news_on(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Noticias del $dateString';
  }

  @override
  String get hiberus => 'hiberus';

  @override
  String get instagram => 'Instagram';

  @override
  String get linkedin => 'LinkedIn';

  @override
  String get github => 'GitHub';
}
