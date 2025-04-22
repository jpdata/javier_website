import 'package:javier_website/core/enums/role.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/about_me.dart';
import 'package:javier_website/model/comment.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/model/user.dart';

extension CommentMapper on CommentDto {
  Comment toEntity() {
    return Comment(
      id: id,
      content: content,
      createdAt: createdAt,
      authorName: authorName,
      authorEmail: authorEmail,
    );
  }
}

extension EntryMapper on EntryDto {
  Future<Entry> toEntity() async {
    var commms = await Future.wait(comments.map((e) async {
      var value = await e.get();
      return value.data?.toEntity();
    }).toList());
    return Entry(
      id: id,
      title: title,
      subtitle: subtitle,
      content: content,
      createdAt: createdAt,
      tags: tags ?? [],
      comments: commms.whereType<Comment>().toList(),
      bannerImageUrl: bannerImageUrl,
    );
  }
}

//map from Entry to EntryDto
extension EntryDtoMapper on Entry {
  EntryDto toDto() {
    return EntryDto(
      id: id,
      title: title,
      subtitle: subtitle,
      content: content,
      createdAt: createdAt,
      tags: tags,
      comments: [], // comments.map((e) => e.toDto()).toList(),
      bannerImageUrl: bannerImageUrl,
    );
  }
}

extension CommentDtoMapper on Comment {
  CommentDto toDto() {
    return CommentDto(
      id: id,
      content: content,
      createdAt: createdAt,
      authorName: authorName,
      authorEmail: authorEmail,
    );
  }
}

extension NewsDtoMapper on NewsEntry {
  NewsDto toDto() {
    return NewsDto(
      id: id,
      content: content,
      createdAt: createdAt,
    );
  }
}

extension NewsEntryMapper on NewsDto {
  NewsEntry toEntity() {
    return NewsEntry(
      id: id,
      content: content,
      createdAt: createdAt,
    );
  }
}

extension AboutMeDtoMapper on AboutMe {
  AboutMeDto toDto() {
    return AboutMeDto(
      id: id,
      content: content,
      language: language,
    );
  }
}

extension AboutMeMapper on AboutMeDto {
  AboutMe toEntity() {
    return AboutMe(
      id: id,
      content: content,
      language: language,
    );
  }
}

extension UserDtoMapper on User {
  UserDto toDto() {
    return UserDto(
      id: id,
      name: name,
      email: email,
      lastName: lastname,
      registryDate: registryDate,
      role: role.name,
      status: status.name,
    );
  }
}

extension UserMapper on UserDto {
  User toEntity() {
    return User(
      id: id,
      name: name,
      lastname: lastName,
      email: email,
      registryDate: registryDate,
      role: Role.values.firstWhere((element) => element.name == role),
      status: Status.values.firstWhere((element) => element.name == status),
    );
  }
}