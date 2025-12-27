// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Javi\'s Personal Website';

  @override
  String get home => 'Home';

  @override
  String get contact_me => 'Contact Me';

  @override
  String get contact_me_body =>
      'If you want to contact me, just email me back at jpdata@gmail.com';

  @override
  String get contact_me_by_email => 'Contact me by Email';

  @override
  String get about_me => 'About Me';

  @override
  String get more_options => 'More Options';

  @override
  String get drawer_header => 'How to reach Javi ...';

  @override
  String get cogito_ergo_sum => 'I program, therefore I am.';

  @override
  String get doing_cool_stuf_with_porgramming_languages =>
      'Doing cool stuff with programming languages.';

  @override
  String get spanish_spain => 'Spanish (Spain)';

  @override
  String get spanish_venezuela => 'Spanish (Venezuela)';

  @override
  String get catalan => 'Catalan';

  @override
  String get english => 'English';

  @override
  String get my_website => 'My Website';

  @override
  String get my_website_description =>
      'sample website and mobile app made with Flutter';

  @override
  String get svg_style_cleaner => 'Svg Style Cleaner';

  @override
  String get svg_style_cleaner_description =>
      'Clean up SVG files by removing unnecessary styles';

  @override
  String get api_open_builder => 'ApiOpenBuilder';

  @override
  String get api_open_builder_description =>
      'Generate Dart API client code from OpenAPI 3.0 spec';

  @override
  String get some_of_my_projects => 'Some of my projects';

  @override
  String get credits_i_must_give => 'Credits I must give';

  @override
  String get my_collaborations => 'Collaborations';

  @override
  String get collaborators => 'Collaborators';

  @override
  String get design_colors_and_images => 'Design, colors and images';

  @override
  String get portfolio => 'Portfolio';

  @override
  String comment_title(String name, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$name commented on $dateString';
  }

  @override
  String get comments => 'Comments';

  @override
  String get newEntry => 'New Entry';

  @override
  String get subtitle => 'Subtitle';

  @override
  String get entryTitle => 'Title';

  @override
  String get content => 'Content';

  @override
  String get bannerImageUrl => 'Banner Image URL';

  @override
  String get tags => 'Tags (comma separated)';

  @override
  String get saveEntry => 'Save Entry';

  @override
  String get pleaseEnterTitle => 'Please enter a title';

  @override
  String get pleaseEnterSubtitle => 'Please enter a subtitle';

  @override
  String get pleaseEnterContent => 'Please enter content';

  @override
  String get pleaseEnterBannerImageUrl => 'Please enter a banner image URL';

  @override
  String get read_more => 'Read More';

  @override
  String get blog => 'Blog';

  @override
  String get blog_entry => 'Blog Entry';

  @override
  String get blog_entries => 'Blog Entries';

  @override
  String get blog_new_entry => 'New Blog Entry';

  @override
  String get blog_edit_entry => 'Edit Entry';

  @override
  String get news => 'News';

  @override
  String get news_entry => 'News Entry';

  @override
  String get news_entries => 'News Entries';

  @override
  String get news_new_entry => 'New Entry';

  @override
  String get news_edit_entry => 'Edit Entry';

  @override
  String get pickAnImage => 'Pick an image';

  @override
  String get signIn => 'Sign In';

  @override
  String get signOut => 'Sign Out';

  @override
  String get signingIn => 'Signing In';

  @override
  String get error => 'Error';

  @override
  String get signingOut => 'Signing Out';

  @override
  String get loadind_data => 'Loading data...';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Delete';

  @override
  String get delete_entry => 'Delete Entry';

  @override
  String get delete_comment => 'Delete Comment';

  @override
  String get back => 'Back';

  @override
  String get return_ => 'Return';

  @override
  String news_on(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'News on $dateString';
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
  String get unknown_error => 'An unknown error occurred';

  @override
  String get network_error =>
      'Network connection error. Please check your internet connection.';

  @override
  String get permission_error =>
      'You don\'t have permission to access this resource';

  @override
  String get timeout_error => 'Request timed out. Please try again.';

  @override
  String get not_found_error => 'The requested resource was not found';

  @override
  String get authentication_error =>
      'Authentication failed. Please log in again.';

  @override
  String get something_went_wrong =>
      'Something went wrong. Please try again later.';

  @override
  String get manage_portfolio => 'Manage Portfolio';

  @override
  String get add_new_portfolio => 'Add New Portfolio';

  @override
  String get edit_portfolio => 'Edit Portfolio';

  @override
  String get portfolio_management => 'Portfolio Management';

  @override
  String get add_new => 'Add New';

  @override
  String get no_portfolio_items => 'No portfolio items yet';

  @override
  String get name => 'Name';

  @override
  String get name_required => 'Name is required';

  @override
  String get description => 'Description';

  @override
  String get description_required => 'Description is required';

  @override
  String get url => 'URL';

  @override
  String get url_required => 'URL is required';

  @override
  String get invalid_url => 'Invalid URL';

  @override
  String get icon_url => 'Icon URL';

  @override
  String get icon_url_helper => 'URL to icon image (optional)';

  @override
  String get icon_type => 'Icon Type';

  @override
  String get icon_is_asset => 'Icon is Asset';

  @override
  String get icon_is_url => 'Icon is URL';

  @override
  String get image_url => 'Image URL';

  @override
  String get image_url_helper => 'URL to project image (optional)';

  @override
  String get save => 'Save';

  @override
  String get saved_successfully => 'Saved successfully';

  @override
  String get confirm_delete => 'Confirm Delete';

  @override
  String get are_you_sure_delete => 'Are you sure you want to delete';

  @override
  String get edit => 'Edit';
}
