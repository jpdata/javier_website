import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:javier_website/core/enums/role.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String lastname,
    required String email,
    required String registryDate,
    required Role role,
    required Status status,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.empty() => const User(
        id: '',
        name: '',
        lastname: '',
        email: '',
        registryDate: '',
        role: Role.user,
        status: Status.inactive,
      );
}
