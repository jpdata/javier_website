import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/mappers.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/viewmodel/auth/auth_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:javier_website/model/user.dart';

part 'user_view_model.g.dart';

final UsersCollectionReference _userCollection = UsersCollectionReference();

@Riverpod()
class UserViewModel extends _$UserViewModel {
  @override
  Future<List<User>> build() async {
    return await _fectchUsers();
  }

  Future<List<User>> _fectchUsers() async {
    var query = await _userCollection.reference.get();
    if (query.docs.isEmpty) {
      return [];
    }

    var result = query.docs.map((doc) => doc.data().toEntity()).toList();

    return result;
  }
}

@Riverpod()
Future<User> currentUser(Ref ref) async {
  final auth = await ref.watch(authViewModelProvider.future);
  final users = await ref.watch(userViewModelProvider.future);

  return users.firstWhere(
    (u) => u.email.toLowerCase() == auth.email.toLowerCase(),
    orElse: () => User.empty(),
  );
}
