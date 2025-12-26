import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'portfolio_entry.freezed.dart';
part 'portfolio_entry.g.dart';

@freezed
sealed class PortfolioEntry with _$PortfolioEntry {
  const factory PortfolioEntry({
    required String id,
    required String name,
    required String description,
    required String url,
    @Default('') String icon,
    @Default(false) bool iconIsAsset,
    @Default('') String imageUrl,
    DateTime? createdAt,
  }) = _PortfolioEntry;

  factory PortfolioEntry.fromJson(Map<String, Object?> json) => _$PortfolioEntryFromJson(json);
}
