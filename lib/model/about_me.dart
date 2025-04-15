import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me.freezed.dart';
part 'about_me.g.dart';

@freezed
sealed class AboutMe with _$AboutMe {
  const factory AboutMe({
    required String id,
    required String content,
    required String language,
  }) = _AboutMe;

  factory AboutMe.fromJson(Map<String, Object?> json) => _$AboutMeFromJson(json);
}
